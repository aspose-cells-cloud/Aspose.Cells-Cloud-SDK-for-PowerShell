# PostCompressRequest — Compress files and generate target files in various formats, supported file formats are include Xls, Xlsx, Xlsm, Xlsb, Ods and more.
class PostCompressRequest : RequestOption {
    [string]$File

    [Nullable[int32]]$CompressLevel
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction

    PostCompressRequest([string]$File) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        $this.File = $File
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/compress'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.CompressLevel) { $q['CompressLevel'] = $this.CompressLevel }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
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
