# ConvertWorksheetToHtmlTableRequest — Converts a worksheet of spreadsheet on a local drive to the HTML table file.
class ConvertWorksheetToHtmlTableRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet

    [string]$Region
    [string]$Password

    ConvertWorksheetToHtmlTableRequest([string]$Spreadsheet, [string]$worksheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/convert/worksheet/html-table'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
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
