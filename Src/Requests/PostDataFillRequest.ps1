# PostDataFillRequest — Data filling for spreadsheet files is primarily used to fill empty data in tables and ranges.
class PostDataFillRequest : RequestOption {
    [DataFillRequest]$DataFillRequest

    PostDataFillRequest([DataFillRequest]$dataFillRequest) {
        if ($null -eq $dataFillRequest) { throw [System.ArgumentException]::new('dataFillRequest is required') }
        $this.DataFillRequest = $dataFillRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/datafill'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataFillRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
