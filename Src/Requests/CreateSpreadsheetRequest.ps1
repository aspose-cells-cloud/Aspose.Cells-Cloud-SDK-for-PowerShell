# CreateSpreadsheetRequest — The Web API allows users to create a new spreadsheet with a specified name. Optionally, a template can be provided to initialize the spreadsheet with predefined content or formatting.
class CreateSpreadsheetRequest : RequestOption {

    [string]$Format
    [string]$Template
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/create'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Format)) { $q['format'] = $this.Format }
        if (-not [string]::IsNullOrEmpty($this.Template)) { $q['template'] = $this.Template }
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
        return @{}
    }
}
