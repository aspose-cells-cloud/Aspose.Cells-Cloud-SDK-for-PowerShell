# SearchSpreadsheetContentRequest — Search text in the local spreadsheet.
class SearchSpreadsheetContentRequest : RequestOption {
    [string]$Spreadsheet
    [string]$SearchText

    [Nullable[bool]]$IgnoringCase
    [string]$Worksheet
    [string]$CellArea
    [string]$Region
    [string]$Password

    SearchSpreadsheetContentRequest([string]$Spreadsheet, [string]$searchText) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.SearchText = $searchText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/search/content'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['searchText'] = $this.SearchText
        if ($null -ne $this.IgnoringCase) { $q['ignoringCase'] = $this.IgnoringCase }
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
