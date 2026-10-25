# PostWorkbooksTextSearchRequest — Search for text in the workbook.
class PostWorkbooksTextSearchRequest : RequestOption {
    [string]$Name
    [string]$Text

    [string]$Folder
    [string]$StorageName

    PostWorkbooksTextSearchRequest([string]$name, [string]$text) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($text)) { throw [System.ArgumentException]::new('text is required') }
        $this.Name = $name
        $this.Text = $text
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/findText'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['text'] = $this.Text
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
