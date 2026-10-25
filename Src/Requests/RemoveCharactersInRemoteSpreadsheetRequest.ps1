# RemoveCharactersInRemoteSpreadsheetRequest — Deletes user-defined characters, predefined symbol sets, or any substring from every cell in the chosen range while preserving formulas, formatting and data-validation for a remote spreadsheet.
class RemoveCharactersInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range

    [string]$RemoveTextMethod
    [string]$CharacterSets
    [string]$RemoveCustomValue
    [Nullable[bool]]$CaseSensitive
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    RemoveCharactersInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/remove/characters'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.RemoveTextMethod)) { $q['removeTextMethod'] = $this.RemoveTextMethod }
        if (-not [string]::IsNullOrEmpty($this.CharacterSets)) { $q['characterSets'] = $this.CharacterSets }
        if (-not [string]::IsNullOrEmpty($this.RemoveCustomValue)) { $q['removeCustomValue'] = $this.RemoveCustomValue }
        if ($null -ne $this.CaseSensitive) { $q['caseSensitive'] = $this.CaseSensitive }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
