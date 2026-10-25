# PostExtractTextRequest — Effortlessly extract text and numbers from Excel cells with precise options. This API allows extraction of first/last characters, text between delimiters, and numbers from strings, with output as static values or formulas.
class PostExtractTextRequest : RequestOption {
    [ExtractTextOptions]$ExtractTextOptions

    PostExtractTextRequest([ExtractTextOptions]$extractTextOptions) {
        if ($null -eq $extractTextOptions) { throw [System.ArgumentException]::new('extractTextOptions is required') }
        $this.ExtractTextOptions = $extractTextOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/extracttext'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.ExtractTextOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
