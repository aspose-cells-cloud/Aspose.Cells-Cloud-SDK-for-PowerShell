# PostSplitTextRequest — Efficiently divides Excel cell content into columns or rows based on specified delimiters or patterns. Supports Character-based splitting, Custom string splitting, Mask and wildcard splitting for pattern-based division, Line break division, Column or row splitting, Delimiter removal or retention.
class PostSplitTextRequest : RequestOption {
    [SplitTextOptions]$SplitTextOptions

    PostSplitTextRequest([SplitTextOptions]$splitTextOptions) {
        if ($null -eq $splitTextOptions) { throw [System.ArgumentException]::new('splitTextOptions is required') }
        $this.SplitTextOptions = $splitTextOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/splittext'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.SplitTextOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
