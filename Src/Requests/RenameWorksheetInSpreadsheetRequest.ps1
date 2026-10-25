# RenameWorksheetInSpreadsheetRequest — The Web API endpoint allows users to rename a specified worksheet within a workbook. This function provides a straightforward way to update worksheet names, enhancing workbook organization and readability.
class RenameWorksheetInSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$SourceName
    [string]$TargetName

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    RenameWorksheetInSpreadsheetRequest([string]$Spreadsheet, [string]$sourceName, [string]$targetName) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($sourceName)) { throw [System.ArgumentException]::new('sourceName is required') }
        if ([string]::IsNullOrEmpty($targetName)) { throw [System.ArgumentException]::new('targetName is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.SourceName = $sourceName
        $this.TargetName = $targetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/spreadsheet/rename/worksheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sourceName'] = $this.SourceName
        $q['targetName'] = $this.TargetName
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
