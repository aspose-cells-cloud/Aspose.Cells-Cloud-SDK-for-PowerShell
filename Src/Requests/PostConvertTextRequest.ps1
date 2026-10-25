# PostConvertTextRequest — Enhance Excel data through essential text conversions: convert text to numbers, replace characters and line breaks, and remove accents.
class PostConvertTextRequest : RequestOption {
    [ConvertTextOptions]$ConvertTextOptions

    PostConvertTextRequest([ConvertTextOptions]$convertTextOptions) {
        if ($null -eq $convertTextOptions) { throw [System.ArgumentException]::new('convertTextOptions is required') }
        $this.ConvertTextOptions = $convertTextOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/converttext'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.ConvertTextOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
