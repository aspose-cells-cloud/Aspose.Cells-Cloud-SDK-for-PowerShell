# CheckWrokbookExternalReferenceRequest — Export Excel internal elements or the workbook itself to various format files.
class CheckWrokbookExternalReferenceRequest : RequestOption {
    [CheckExternalReferenceOptions]$CheckExternalReferenceOptions

    CheckWrokbookExternalReferenceRequest([CheckExternalReferenceOptions]$checkExternalReferenceOptions) {
        if ($null -eq $checkExternalReferenceOptions) { throw [System.ArgumentException]::new('checkExternalReferenceOptions is required') }
        $this.CheckExternalReferenceOptions = $checkExternalReferenceOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/checkexternalreference'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.CheckExternalReferenceOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
