# PostAnalyzeExcelRequest — Perform business analysis of data in Excel files.
class PostAnalyzeExcelRequest : RequestOption {
    [AnalyzeExcelRequest]$AnalyzeExcelRequest

    PostAnalyzeExcelRequest([AnalyzeExcelRequest]$analyzeExcelRequest) {
        if ($null -eq $analyzeExcelRequest) { throw [System.ArgumentException]::new('analyzeExcelRequest is required') }
        $this.AnalyzeExcelRequest = $analyzeExcelRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/analyze'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.AnalyzeExcelRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
