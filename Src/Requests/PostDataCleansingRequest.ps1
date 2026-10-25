# PostDataCleansingRequest — Data cleansing of spreadsheet files is a data management process used to identify, correct, and remove errors, incompleteness, duplicates, or inaccuracies in tables and ranges.
class PostDataCleansingRequest : RequestOption {
    [DataCleansingRequest]$DataCleansingRequest

    PostDataCleansingRequest([DataCleansingRequest]$dataCleansingRequest) {
        if ($null -eq $dataCleansingRequest) { throw [System.ArgumentException]::new('dataCleansingRequest is required') }
        $this.DataCleansingRequest = $dataCleansingRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/datacleansing'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataCleansingRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
