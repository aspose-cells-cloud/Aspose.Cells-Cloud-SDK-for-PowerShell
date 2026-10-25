# CompressSpreadsheetRequest — The Web API endpoint allows users to compress a spreadsheet to reduce its file size. This function provides a straightforward way to optimize the storage and performance of spreadsheets by applying a specified compression level.
class CompressSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [int32]$Level

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    CompressSpreadsheetRequest([string]$Spreadsheet, [int32]$level) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Level = $level
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/compress'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['level'] = $this.Level
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
