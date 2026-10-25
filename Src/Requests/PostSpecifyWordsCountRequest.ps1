# PostSpecifyWordsCountRequest
class PostSpecifyWordsCountRequest : RequestOption {
    [SpecifyWordsCountOptions]$SpecifyWordsCountOptions

    PostSpecifyWordsCountRequest([SpecifyWordsCountOptions]$specifyWordsCountOptions) {
        if ($null -eq $specifyWordsCountOptions) { throw [System.ArgumentException]::new('specifyWordsCountOptions is required') }
        $this.SpecifyWordsCountOptions = $specifyWordsCountOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/specifywordscount'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.SpecifyWordsCountOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
