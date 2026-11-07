# SmartMarkerTemplateRequest — Generates reports using Smart Marker template technology with JSON data.
class SmartMarkerTemplateRequest : RequestOption {
    [string]$Datafile
    [string]$Templatefile

    [string]$Region
    [string]$Password

    SmartMarkerTemplateRequest([string]$datafile, [string]$templatefile) {
        if ([string]::IsNullOrEmpty($datafile)) { throw [System.ArgumentException]::new('datafile is required') }
        if ([string]::IsNullOrEmpty($templatefile)) { throw [System.ArgumentException]::new('templatefile is required') }
        $this.Datafile = $datafile
        $this.Templatefile = $templatefile
    }

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
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.Datafile)] = $this.Datafile
        $f['@' + [System.IO.Path]::GetFileName($this.Templatefile)] = $this.Templatefile
        return $f
    }
}
