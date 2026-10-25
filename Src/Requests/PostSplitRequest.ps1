# PostSplitRequest — Split Excel spreadsheet files based on worksheets and create output files in various formats.
class PostSplitRequest : RequestOption {
    [string]$File
    [string]$OutFormat

    [string]$Password
    [Nullable[int32]]$From
    [Nullable[int32]]$To
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostSplitRequest([string]$File, [string]$outFormat) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($outFormat)) { throw [System.ArgumentException]::new('outFormat is required') }
        $this.File = $File
        $this.OutFormat = $outFormat
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/split'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['outFormat'] = $this.OutFormat
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if ($null -ne $this.From) { $q['from'] = $this.From }
        if ($null -ne $this.To) { $q['to'] = $this.To }
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
