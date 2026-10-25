# GetWorksheetsWithLocalSpreadsheetRequest — Fetches a complete list of worksheets from the currently active local spreadsheet.
class GetWorksheetsWithLocalSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet

    [string]$Region
    [string]$Password

    GetWorksheetsWithLocalSpreadsheetRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/worksheets'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
