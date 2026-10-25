# MoveWorksheetInSpreadsheetRequest — The Web API endpoint allows users to move a specified worksheet within a workbook. This function provides a straightforward way to move a worksheet, enhancing workbook organization.
class MoveWorksheetInSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [int32]$Position

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    MoveWorksheetInSpreadsheetRequest([string]$Spreadsheet, [string]$worksheet, [int32]$position) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.Position = $position
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/move/worksheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['position'] = $this.Position
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
