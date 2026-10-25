# PostDataTransformationRequest — Transform spreadsheet data is mainly used to pivot columns, unpivot columns.
class PostDataTransformationRequest : RequestOption {
    [DataTransformationRequest]$DataTransformationRequest

    PostDataTransformationRequest([DataTransformationRequest]$dataTransformationRequest) {
        if ($null -eq $dataTransformationRequest) { throw [System.ArgumentException]::new('dataTransformationRequest is required') }
        $this.DataTransformationRequest = $dataTransformationRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/datatransformation'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataTransformationRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
