# PostAutofitWorkbookColumnsRequest — Autofit columns in the workbook.
class PostAutofitWorkbookColumnsRequest : RequestOption {
    [string]$Name

    [Nullable[int32]]$StartColumn
    [Nullable[int32]]$EndColumn
    [string]$Folder
    [string]$StorageName

    PostAutofitWorkbookColumnsRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/autofitcolumns'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.StartColumn) { $q['startColumn'] = $this.StartColumn }
        if ($null -ne $this.EndColumn) { $q['endColumn'] = $this.EndColumn }
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
