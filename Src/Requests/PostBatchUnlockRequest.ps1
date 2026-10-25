# PostBatchUnlockRequest — Batch unlocking files that meet specific matching conditions.
class PostBatchUnlockRequest : RequestOption {
    [BatchLockRequest]$BatchLockRequest

    PostBatchUnlockRequest([BatchLockRequest]$batchLockRequest) {
        if ($null -eq $batchLockRequest) { throw [System.ArgumentException]::new('batchLockRequest is required') }
        $this.BatchLockRequest = $batchLockRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/batch/unlock'
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
