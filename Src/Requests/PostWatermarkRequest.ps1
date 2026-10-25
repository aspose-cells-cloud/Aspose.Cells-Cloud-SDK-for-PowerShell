# PostWatermarkRequest — Add Text Watermark to Excel files and generate output files in various formats.
class PostWatermarkRequest : RequestOption {
    [string]$File
    [string]$Text
    [string]$Color

    [string]$OutFormat
    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostWatermarkRequest([string]$File, [string]$text, [string]$color) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($text)) { throw [System.ArgumentException]::new('text is required') }
        if ([string]::IsNullOrEmpty($color)) { throw [System.ArgumentException]::new('color is required') }
        $this.File = $File
        $this.Text = $text
        $this.Color = $color
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/watermark'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['text'] = $this.Text
        $q['color'] = $this.Color
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
