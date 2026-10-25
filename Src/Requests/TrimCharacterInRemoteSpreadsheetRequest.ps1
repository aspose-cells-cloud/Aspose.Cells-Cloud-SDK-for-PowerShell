# TrimCharacterInRemoteSpreadsheetRequest — The TrimSpreadsheetContent API is designed to process and trim content within a spreadsheet. This API allows users to remove extra spaces, line breaks, or other unnecessary characters from the content of selected cells. It is particularly useful for cleaning up data entries and ensuring consistency in spreadsheet formatting
class TrimCharacterInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range

    [string]$TrimContent
    [Nullable[bool]]$TrimLeading
    [Nullable[bool]]$TrimTrailing
    [Nullable[bool]]$TrimSpaceBetweenWordTo1
    [Nullable[bool]]$TrimNonBreakingSpaces
    [Nullable[bool]]$RemoveExtraLineBreaks
    [Nullable[bool]]$RemoveAllLineBreaks
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    TrimCharacterInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/trim'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.TrimContent)) { $q['trimContent'] = $this.TrimContent }
        if ($null -ne $this.TrimLeading) { $q['trimLeading'] = $this.TrimLeading }
        if ($null -ne $this.TrimTrailing) { $q['trimTrailing'] = $this.TrimTrailing }
        if ($null -ne $this.TrimSpaceBetweenWordTo1) { $q['trimSpaceBetweenWordTo1'] = $this.TrimSpaceBetweenWordTo1 }
        if ($null -ne $this.TrimNonBreakingSpaces) { $q['trimNonBreakingSpaces'] = $this.TrimNonBreakingSpaces }
        if ($null -ne $this.RemoveExtraLineBreaks) { $q['removeExtraLineBreaks'] = $this.RemoveExtraLineBreaks }
        if ($null -ne $this.RemoveAllLineBreaks) { $q['removeAllLineBreaks'] = $this.RemoveAllLineBreaks }
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
