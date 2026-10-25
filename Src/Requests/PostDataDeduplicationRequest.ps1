# PostDataDeduplicationRequest — Data deduplication of spreadsheet files is mainly used to eliminate duplicate data in tables and ranges.
class PostDataDeduplicationRequest : RequestOption {
    [DataDeduplicationRequest]$DataDeduplicationRequest

    PostDataDeduplicationRequest([DataDeduplicationRequest]$dataDeduplicationRequest) {
        if ($null -eq $dataDeduplicationRequest) { throw [System.ArgumentException]::new('dataDeduplicationRequest is required') }
        $this.DataDeduplicationRequest = $dataDeduplicationRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/datadeduplication'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataDeduplicationRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
