# TrimCharacterRequest — The TrimSpreadsheetContent API is designed to process and trim content within a remote spreadsheet. This API allows users to remove extra spaces, line breaks, or other unnecessary characters from the content of selected cells. It is particularly useful for cleaning up data entries and ensuring consistency in spreadsheet formatting
class TrimCharacterRequest : RequestOption {
    [string]$Spreadsheet

    [string]$TrimContent
    [Nullable[bool]]$TrimLeading
    [Nullable[bool]]$TrimTrailing
    [Nullable[bool]]$TrimSpaceBetweenWordTo1
    [Nullable[bool]]$TrimNonBreakingSpaces
    [Nullable[bool]]$RemoveExtraLineBreaks
    [Nullable[bool]]$RemoveAllLineBreaks
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    TrimCharacterRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/trim'
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
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.Range)) { $q['range'] = $this.Range }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.Spreadsheet)] = $this.Spreadsheet
        return $f
    }
}
