# PostWorkbookTextReplaceRequest — Replace text in the workbook.
class PostWorkbookTextReplaceRequest : RequestOption {
    [string]$Name
    [string]$OldValue
    [string]$NewValue

    [string]$Folder
    [string]$StorageName

    PostWorkbookTextReplaceRequest([string]$name, [string]$oldValue, [string]$newValue) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($oldValue)) { throw [System.ArgumentException]::new('oldValue is required') }
        if ([string]::IsNullOrEmpty($newValue)) { throw [System.ArgumentException]::new('newValue is required') }
        $this.Name = $name
        $this.OldValue = $oldValue
        $this.NewValue = $newValue
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/replaceText'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['oldValue'] = $this.OldValue
        $q['newValue'] = $this.NewValue
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
