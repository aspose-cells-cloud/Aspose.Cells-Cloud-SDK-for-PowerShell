# PostAutofitWorkbookRowsRequest — Autofit rows in the workbook.
class PostAutofitWorkbookRowsRequest : RequestOption {
    [string]$Name

    [Nullable[int32]]$StartRow
    [Nullable[int32]]$EndRow
    [Nullable[bool]]$OnlyAuto
    [string]$Folder
    [string]$StorageName
    [Nullable[int32]]$FirstColumn
    [Nullable[int32]]$LastColumn

    PostAutofitWorkbookRowsRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/autofitrows'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.StartRow) { $q['startRow'] = $this.StartRow }
        if ($null -ne $this.EndRow) { $q['endRow'] = $this.EndRow }
        if ($null -ne $this.OnlyAuto) { $q['onlyAuto'] = $this.OnlyAuto }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if ($null -ne $this.FirstColumn) { $q['firstColumn'] = $this.FirstColumn }
        if ($null -ne $this.LastColumn) { $q['lastColumn'] = $this.LastColumn }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
