# PostAddTextContentRequest — Adds text content to a specified location within a document. It requires an object that defines the text to be added and the insertion location.
class PostAddTextContentRequest : RequestOption {
    [AddTextOptions]$AddTextOptions

    PostAddTextContentRequest([AddTextOptions]$addTextOptions) {
        if ($null -eq $addTextOptions) { throw [System.ArgumentException]::new('addTextOptions is required') }
        $this.AddTextOptions = $addTextOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/addtext'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.AddTextOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
