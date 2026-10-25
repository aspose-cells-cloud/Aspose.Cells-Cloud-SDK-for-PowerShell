# ReplaceSpreadsheetContentRequest — Replace text in the local spreadsheet.
class ReplaceSpreadsheetContentRequest : RequestOption {
    [string]$Spreadsheet
    [string]$SearchText
    [string]$ReplaceText

    [string]$Worksheet
    [string]$CellArea
    [string]$Region
    [string]$Password

    ReplaceSpreadsheetContentRequest([string]$Spreadsheet, [string]$searchText, [string]$replaceText) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        if ([string]::IsNullOrEmpty($replaceText)) { throw [System.ArgumentException]::new('replaceText is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.SearchText = $searchText
        $this.ReplaceText = $replaceText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/replace/content'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['searchText'] = $this.SearchText
        $q['replaceText'] = $this.ReplaceText
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.CellArea)) { $q['cellArea'] = $this.CellArea }
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
