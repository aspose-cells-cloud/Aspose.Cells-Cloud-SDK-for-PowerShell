# PostDeleteIncompleteRowsRequest — Deleting incomplete rows of spreadsheet files is mainly used to eliminate incomplete rows in tables and ranges.
class PostDeleteIncompleteRowsRequest : RequestOption {
    [DeleteIncompleteRowsRequest]$DeleteIncompleteRowsRequest

    PostDeleteIncompleteRowsRequest([DeleteIncompleteRowsRequest]$deleteIncompleteRowsRequest) {
        if ($null -eq $deleteIncompleteRowsRequest) { throw [System.ArgumentException]::new('deleteIncompleteRowsRequest is required') }
        $this.DeleteIncompleteRowsRequest = $deleteIncompleteRowsRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/deleteincompleterows'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.DeleteIncompleteRowsRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
