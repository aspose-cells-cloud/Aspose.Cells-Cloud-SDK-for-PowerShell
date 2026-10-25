# UnprotectSpreadsheetRequest — Removes dual-layer password protection from Excel spreadsheets, supporting both open and modify passwords with encryption.
class UnprotectSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Password
    [string]$ModifyPassword

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region

    UnprotectSpreadsheetRequest([string]$Spreadsheet, [string]$password, [string]$modifyPassword) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($password)) { throw [System.ArgumentException]::new('password is required') }
        if ([string]::IsNullOrEmpty($modifyPassword)) { throw [System.ArgumentException]::new('modifyPassword is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Password = $password
        $this.ModifyPassword = $modifyPassword
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/unprotection/spreadsheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['password'] = $this.Password
        $q['modifyPassword'] = $this.ModifyPassword
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
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
