# PostTrimContentRequest — The PostTrimContent API is designed to process and trim content within a specified range in a spreadsheet. This API allows users to remove extra spaces, line breaks, or other unnecessary characters from the content of selected cells. It is particularly useful for cleaning up data entries and ensuring consistency in spreadsheet formatting
class PostTrimContentRequest : RequestOption {
    [TrimContentOptions]$TrimContentOptions

    PostTrimContentRequest([TrimContentOptions]$trimContentOptions) {
        if ($null -eq $trimContentOptions) { throw [System.ArgumentException]::new('trimContentOptions is required') }
        $this.TrimContentOptions = $trimContentOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/trimcontent'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.TrimContentOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
