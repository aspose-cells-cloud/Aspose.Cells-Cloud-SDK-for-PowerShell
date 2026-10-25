# DeleteWorksheetFromSpreadsheetRequest — The Web API endpoint allows users to delete a specified worksheet from a workbook. This function provides a straightforward way to manage workbook structure by removing unnecessary or redundant worksheets.
class DeleteWorksheetFromSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$SheetName

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    DeleteWorksheetFromSpreadsheetRequest([string]$Spreadsheet, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/delete/worksheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sheetName'] = $this.SheetName
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
