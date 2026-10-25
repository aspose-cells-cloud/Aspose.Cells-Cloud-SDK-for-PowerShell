# PostBatchLockRequest — Batch locking files that meet specific matching conditions.
class PostBatchLockRequest : RequestOption {
    [BatchLockRequest]$BatchLockRequest

    PostBatchLockRequest([BatchLockRequest]$batchLockRequest) {
        if ($null -eq $batchLockRequest) { throw [System.ArgumentException]::new('batchLockRequest is required') }
        $this.BatchLockRequest = $batchLockRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/batch/lock'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.BatchLockRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
