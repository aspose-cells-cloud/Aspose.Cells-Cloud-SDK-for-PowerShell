# MathCalculateRequest
class MathCalculateRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Operation
    [string]$Value

    [string]$Worksheet
    [string]$Range
    [string]$Region
    [string]$Password

    MathCalculateRequest([string]$Spreadsheet, [string]$operation, [string]$value) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($operation)) { throw [System.ArgumentException]::new('operation is required') }
        if ([string]::IsNullOrEmpty($value)) { throw [System.ArgumentException]::new('value is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Operation = $operation
        $this.Value = $value
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/calculate/math'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['operation'] = $this.Operation
        $q['value'] = $this.Value
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.Range)) { $q['range'] = $this.Range }
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
