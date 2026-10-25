# SmartMarkerTemplateRequest
class SmartMarkerTemplateRequest : RequestOption {

    [string]$Region
    [string]$Password

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/report/smart/template'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
