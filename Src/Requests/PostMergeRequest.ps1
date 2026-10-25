# PostMergeRequest — Merge cells in the worksheet.
class PostMergeRequest : RequestOption {
    [string]$File

    [string]$OutFormat
    [Nullable[bool]]$MergeToOneSheet
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostMergeRequest([string]$File) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        $this.File = $File
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/merge'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if ($null -ne $this.MergeToOneSheet) { $q['mergeToOneSheet'] = $this.MergeToOneSheet }
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
