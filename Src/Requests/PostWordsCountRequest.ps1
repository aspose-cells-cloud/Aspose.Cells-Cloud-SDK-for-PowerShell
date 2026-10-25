# PostWordsCountRequest
class PostWordsCountRequest : RequestOption {
    [WordsCountOptions]$WordsCountOptions

    PostWordsCountRequest([WordsCountOptions]$wordsCountOptions) {
        if ($null -eq $wordsCountOptions) { throw [System.ArgumentException]::new('wordsCountOptions is required') }
        $this.WordsCountOptions = $wordsCountOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/wordscount'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.WordsCountOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
