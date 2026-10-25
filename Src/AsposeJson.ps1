# AsposeJson — JSON serialization helpers.
# Reproduces the Go SDK's `omitempty` behavior: $null and empty values are dropped
# from the serialized output. Property names (already PascalCase) are used verbatim
# as JSON keys, matching the Go `json` tags.

# Recursively convert a model object into a hashtable of only non-null/non-empty values.
#
# NOTE: PowerShell "unrolls" a single-element collection when a function RETURNS it
# (e.g. `return $arr` where `$arr` is a List holding one item emits the item, not the
# list). That silently turns a [T[]] field holding one item (e.g. `PivotTableFieldRequest.Data
# = @(0)`) into a scalar, which the API rejects. Collections are therefore returned
# wrapped with the unary comma (`return , $arr`) so they survive the return unroll.
function ConvertTo-AsposeHashtable {
    param([object]$Value)

    if ($null -eq $Value) { return $null }

    # Value types (int, bool, double, DateTime, Nullable[T], enums) are leaves.
    if ($Value -is [System.ValueType]) { return $Value }

    # Strings and byte arrays are leaves.
    if ($Value -is [string]) { return $Value }
    if ($Value -is [byte[]]) { return $Value }

    # Dictionaries (already converted) recurse into their values.
    if ($Value -is [System.Collections.IDictionary]) {
        $ht = [ordered]@{}
        foreach ($key in $Value.Keys) {
            $v = ConvertTo-AsposeHashtable -Value $Value[$key]
            if ($null -ne $v) { $ht[$key] = $v }
        }
        return $ht
    }

    # Collections (arrays of models) recurse into their elements.
    if ($Value -is [System.Collections.IEnumerable]) {
        $arr = [System.Collections.Generic.List[object]]::new()
        foreach ($item in $Value) {
            $v = ConvertTo-AsposeHashtable -Value $item
            if ($null -ne $v) { $arr.Add($v) }
        }
        if ($arr.Count -eq 0) { return $null }
        return , $arr
    }

    # A reference-type object — treat as a model class instance and reflect over its properties.
    $ht = [ordered]@{}
    foreach ($prop in $Value.PSObject.Properties) {
        if ($null -eq $prop.Value) { continue }
        if ($prop.Value -is [string] -and [string]::IsNullOrEmpty([string]$prop.Value)) { continue }
        $v = ConvertTo-AsposeHashtable -Value $prop.Value
        if ($null -ne $v) { $ht[$prop.Name] = $v }
    }
    return $ht
}

# Serialize a model object (or hashtable/array) to a JSON string, omitting null/empty values.
function ConvertTo-AsposeJson {
    param([object]$InputObject, [int]$Depth = 64)

    if ($null -eq $InputObject) { return 'null' }
    $ht = ConvertTo-AsposeHashtable -Value $InputObject
    if ($null -eq $ht) { return 'null' }
    # -InputObject (not the pipeline) so a single-element array body is not unrolled.
    return (ConvertTo-Json -InputObject $ht -Depth $Depth -Compress)
}

# Convert a query-parameter value to its wire string (booleans lowercased to match Go).
function ConvertTo-AsposeQueryString {
    param([object]$Value)

    if ($null -eq $Value) { return '' }
    $s = [string]$Value
    if ($s -eq 'True') { return 'true' }
    if ($s -eq 'False') { return 'false' }
    return $s
}
