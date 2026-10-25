# PostRemoveDuplicatesRequest — Efficiently remove duplicate substrings from Excel cells. Select a range, specify delimiters, and apply options to eliminate repeated text segments.
class PostRemoveDuplicatesRequest : RequestOption {
    [RemoveDuplicatesOptions]$RemoveDuplicatesOptions

    PostRemoveDuplicatesRequest([RemoveDuplicatesOptions]$removeDuplicatesOptions) {
        if ($null -eq $removeDuplicatesOptions) { throw [System.ArgumentException]::new('removeDuplicatesOptions is required') }
        $this.RemoveDuplicatesOptions = $removeDuplicatesOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/removeduplicates'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.RemoveDuplicatesOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
