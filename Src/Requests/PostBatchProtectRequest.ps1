# PostBatchProtectRequest — Batch protecting files that meet specific matching conditions.
class PostBatchProtectRequest : RequestOption {
    [BatchProtectRequest]$BatchProtectRequest

    PostBatchProtectRequest([BatchProtectRequest]$batchProtectRequest) {
        if ($null -eq $batchProtectRequest) { throw [System.ArgumentException]::new('batchProtectRequest is required') }
        $this.BatchProtectRequest = $batchProtectRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/batch/protect'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.BatchProtectRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
