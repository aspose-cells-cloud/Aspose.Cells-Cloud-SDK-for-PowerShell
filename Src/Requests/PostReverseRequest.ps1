# PostReverseRequest — Reverse rows or columns in Excel files and create output files in various formats.
class PostReverseRequest : RequestOption {
    [string]$File
    [string]$RotateType

    [string]$OutFormat
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostReverseRequest([string]$File, [string]$rotateType) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($rotateType)) { throw [System.ArgumentException]::new('rotateType is required') }
        $this.File = $File
        $this.RotateType = $rotateType
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/reverse'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['rotateType'] = $this.RotateType
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
