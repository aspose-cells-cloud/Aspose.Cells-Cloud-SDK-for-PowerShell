# PostAssembleRequest — Assemble data files with template files to generate files in various formats.
class PostAssembleRequest : RequestOption {
    [string]$File
    [string]$Datasource

    [string]$OutFormat
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostAssembleRequest([string]$File, [string]$datasource) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($datasource)) { throw [System.ArgumentException]::new('datasource is required') }
        $this.File = $File
        $this.Datasource = $datasource
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/assemble'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['datasource'] = $this.Datasource
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File
        return $f
    }
}
