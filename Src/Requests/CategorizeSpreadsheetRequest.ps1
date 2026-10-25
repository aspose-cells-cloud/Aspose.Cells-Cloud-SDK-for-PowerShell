# CategorizeSpreadsheetRequest — AI-powered data categorization: Automatically classifies spreadsheet column data into logical groups.
class CategorizeSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$TargetColumn

    [string]$SheetName
    [string]$NewColumnName
    [string]$Region
    [string]$Password

    CategorizeSpreadsheetRequest([string]$Spreadsheet, [string]$targetColumn) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($targetColumn)) { throw [System.ArgumentException]::new('targetColumn is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.TargetColumn = $targetColumn
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/ai/categorize/spreadsheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['targetColumn'] = $this.TargetColumn
        if (-not [string]::IsNullOrEmpty($this.SheetName)) { $q['sheetName'] = $this.SheetName }
        if (-not [string]::IsNullOrEmpty($this.NewColumnName)) { $q['newColumnName'] = $this.NewColumnName }
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
