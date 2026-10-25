# PostUpdateWordCaseRequest — Managing inconsistent text case in spreadsheets (Excel, Google Sheets, CSV) can be frustrating, especially with large datasets. The PostUpdateWordCase WEB API solves this by automating text case conversions, ensuring clean and standardized data.
class PostUpdateWordCaseRequest : RequestOption {
    [WordCaseOptions]$WordCaseOptions

    PostUpdateWordCaseRequest([WordCaseOptions]$wordCaseOptions) {
        if ($null -eq $wordCaseOptions) { throw [System.ArgumentException]::new('wordCaseOptions is required') }
        $this.WordCaseOptions = $wordCaseOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/updatewordcase'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.WordCaseOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
