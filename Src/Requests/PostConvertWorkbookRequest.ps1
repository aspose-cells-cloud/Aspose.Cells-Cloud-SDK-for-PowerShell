# PostConvertWorkbookRequest
class PostConvertWorkbookRequest : RequestOption {
    [ConvertWorkbookOptions]$ConvertWorkbookOptions

    [string]$FontsLocation

    PostConvertWorkbookRequest([ConvertWorkbookOptions]$convertWorkbookOptions) {
        if ($null -eq $convertWorkbookOptions) { throw [System.ArgumentException]::new('convertWorkbookOptions is required') }
        $this.ConvertWorkbookOptions = $convertWorkbookOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/convertWorkbook'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ConvertWorkbookOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
