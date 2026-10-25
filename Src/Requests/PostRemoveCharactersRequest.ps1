# PostRemoveCharactersRequest — A comprehensive set of tools for cleaning text content within selected cells. It allows users to remove specific characters, character sets, and substrings, ensuring that the text is standardized and free from unwanted symbols or sequences.
class PostRemoveCharactersRequest : RequestOption {
    [RemoveCharactersOptions]$RemoveCharactersOptions

    PostRemoveCharactersRequest([RemoveCharactersOptions]$removeCharactersOptions) {
        if ($null -eq $removeCharactersOptions) { throw [System.ArgumentException]::new('removeCharactersOptions is required') }
        $this.RemoveCharactersOptions = $removeCharactersOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/removecharacters'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.RemoveCharactersOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
