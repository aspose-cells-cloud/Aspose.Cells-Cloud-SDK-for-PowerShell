# AggregateCellsByColorRequest — The Aggregate by Color API provides a convenient way to perform calculations on cells that share the same fill or font color. This API supports a range of aggregate operations, including count, sum, maximum value, minimum value, and average value, enabling you to analyze and summarize data based on color distinctions.
class AggregateCellsByColorRequest : RequestOption {
    [string]$Spreadsheet

    [string]$Worksheet
    [string]$Range
    [string]$Operation
    [string]$ColorPosition
    [string]$Region
    [string]$Password

    AggregateCellsByColorRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/calculate/aggergate/color'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.Range)) { $q['range'] = $this.Range }
        if (-not [string]::IsNullOrEmpty($this.Operation)) { $q['operation'] = $this.Operation }
        if (-not [string]::IsNullOrEmpty($this.ColorPosition)) { $q['colorPosition'] = $this.ColorPosition }
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
