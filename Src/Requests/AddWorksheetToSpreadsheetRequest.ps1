# AddWorksheetToSpreadsheetRequest — The Web API enables users to add a new worksheet to a workbook, specifying the worksheet's type, position, and name. This function provides flexibility in managing workbook structure by allowing detailed control over worksheet addition.
class AddWorksheetToSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet

    [string]$SheetType
    [Nullable[int32]]$Position
    [string]$SheetName
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    AddWorksheetToSpreadsheetRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/add/worksheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.SheetType)) { $q['sheetType'] = $this.SheetType }
        if ($null -ne $this.Position) { $q['position'] = $this.Position }
        if (-not [string]::IsNullOrEmpty($this.SheetName)) { $q['sheetName'] = $this.SheetName }
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
