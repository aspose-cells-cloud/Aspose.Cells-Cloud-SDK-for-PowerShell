# PostConvertWorksheetToImageRequest
class PostConvertWorksheetToImageRequest : RequestOption {
    [ConvertWorksheetOptions]$ConvertWorksheetOptions

    [string]$FontsLocation

    PostConvertWorksheetToImageRequest([ConvertWorksheetOptions]$convertWorksheetOptions) {
        if ($null -eq $convertWorksheetOptions) { throw [System.ArgumentException]::new('convertWorksheetOptions is required') }
        $this.ConvertWorksheetOptions = $convertWorksheetOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/convertWorksheetToImage'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ConvertWorksheetOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
