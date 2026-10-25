# PostClearObjectsRequest — Clear internal elements in Excel files and generate output files in various formats.
class PostClearObjectsRequest : RequestOption {
    [string]$File
    [string]$Objecttype

    [string]$Sheetname
    [string]$OutFormat
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostClearObjectsRequest([string]$File, [string]$objecttype) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($objecttype)) { throw [System.ArgumentException]::new('objecttype is required') }
        $this.File = $File
        $this.Objecttype = $objecttype
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/clearobjects'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['objecttype'] = $this.Objecttype
        if (-not [string]::IsNullOrEmpty($this.Sheetname)) { $q['sheetname'] = $this.Sheetname }
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
