# CalculationFormulaRequest
class CalculationFormulaRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [string]$Formula

    [string]$Region
    [string]$Password

    CalculationFormulaRequest([string]$Spreadsheet, [string]$worksheet, [string]$formula) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($formula)) { throw [System.ArgumentException]::new('formula is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.Formula = $formula
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/calculate/formula'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['formula'] = $this.Formula
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
