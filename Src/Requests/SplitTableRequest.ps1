# SplitTableRequest — Split an Excel worksheet tale into multiple sheets by column value.
class SplitTableRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [string]$TableName
    [string]$SplitColumnName
    [bool]$SaveSplitColumn
    [int32]$SplitRowNumber
    [bool]$ToNewWorkbook
    [bool]$ToMultipleFiles

    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    SplitTableRequest([string]$Spreadsheet, [string]$worksheet, [string]$tableName, [string]$splitColumnName, [bool]$saveSplitColumn, [int32]$splitRowNumber, [bool]$toNewWorkbook, [bool]$toMultipleFiles) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($tableName)) { throw [System.ArgumentException]::new('tableName is required') }
        if ([string]::IsNullOrEmpty($splitColumnName)) { throw [System.ArgumentException]::new('splitColumnName is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.TableName = $tableName
        $this.SplitColumnName = $splitColumnName
        $this.SaveSplitColumn = $saveSplitColumn
        $this.SplitRowNumber = $splitRowNumber
        $this.ToNewWorkbook = $toNewWorkbook
        $this.ToMultipleFiles = $toMultipleFiles
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/split/table'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['tableName'] = $this.TableName
        $q['splitColumnName'] = $this.SplitColumnName
        $q['saveSplitColumn'] = $this.SaveSplitColumn
        $q['splitRowNumber'] = $this.SplitRowNumber
        $q['toNewWorkbook'] = $this.ToNewWorkbook
        $q['toMultipleFiles'] = $this.ToMultipleFiles
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['fontsLocation'] = $this.FontsLocation }
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
