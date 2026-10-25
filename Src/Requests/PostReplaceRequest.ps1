# PostReplaceRequest — Replace specified text with new text in Excel files.
class PostReplaceRequest : RequestOption {
    [string]$File
    [string]$Text
    [string]$Newtext

    [string]$Password
    [string]$Sheetname
    [Nullable[bool]]$CheckExcelRestriction

    PostReplaceRequest([string]$File, [string]$text, [string]$newtext) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($text)) { throw [System.ArgumentException]::new('text is required') }
        if ([string]::IsNullOrEmpty($newtext)) { throw [System.ArgumentException]::new('newtext is required') }
        $this.File = $File
        $this.Text = $text
        $this.Newtext = $newtext
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/replace'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['text'] = $this.Text
        $q['newtext'] = $this.Newtext
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if (-not [string]::IsNullOrEmpty($this.Sheetname)) { $q['sheetname'] = $this.Sheetname }
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
