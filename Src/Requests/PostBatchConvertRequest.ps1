# PostBatchConvertRequest — Batch converting files that meet specific matching conditions.
class PostBatchConvertRequest : RequestOption {
    [BatchConvertRequest]$BatchConvertRequest

    PostBatchConvertRequest([BatchConvertRequest]$batchConvertRequest) {
        if ($null -eq $batchConvertRequest) { throw [System.ArgumentException]::new('batchConvertRequest is required') }
        $this.BatchConvertRequest = $batchConvertRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/batch/convert'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.BatchConvertRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
