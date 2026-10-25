# CheckWorkbookFormulaErrorsRequest
class CheckWorkbookFormulaErrorsRequest : RequestOption {
    [CheckFormulaErrorOptions]$FormulaErrorOptions

    CheckWorkbookFormulaErrorsRequest([CheckFormulaErrorOptions]$formulaErrorOptions) {
        if ($null -eq $formulaErrorOptions) { throw [System.ArgumentException]::new('formulaErrorOptions is required') }
        $this.FormulaErrorOptions = $formulaErrorOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/checkformulaerrors'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.FormulaErrorOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
