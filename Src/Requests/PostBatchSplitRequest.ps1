# PostBatchSplitRequest — Batch splitting files that meet specific matching conditions.
class PostBatchSplitRequest : RequestOption {
    [BatchSplitRequest]$BatchSplitRequest

    PostBatchSplitRequest([BatchSplitRequest]$batchSplitRequest) {
        if ($null -eq $batchSplitRequest) { throw [System.ArgumentException]::new('batchSplitRequest is required') }
        $this.BatchSplitRequest = $batchSplitRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/batch/split'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.BatchSplitRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
