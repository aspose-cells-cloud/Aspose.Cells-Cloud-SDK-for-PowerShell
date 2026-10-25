# RemoveSpreadsheetBlankColumnsRequest — Delete all blank rows that do not contain any data or other objects.
class RemoveSpreadsheetBlankColumnsRequest : RequestOption {
    [string]$Spreadsheet

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    RemoveSpreadsheetBlankColumnsRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/remove/blank-columns'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
