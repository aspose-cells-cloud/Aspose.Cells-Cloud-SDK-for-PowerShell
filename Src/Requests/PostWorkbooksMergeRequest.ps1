# PostWorkbooksMergeRequest — Merge a workbook into the existing workbook.
class PostWorkbooksMergeRequest : RequestOption {
    [string]$Name
    [string]$MergeWith

    [string]$Folder
    [string]$StorageName
    [string]$MergedStorageName

    PostWorkbooksMergeRequest([string]$name, [string]$mergeWith) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($mergeWith)) { throw [System.ArgumentException]::new('mergeWith is required') }
        $this.Name = $name
        $this.MergeWith = $mergeWith
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/merge'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['mergeWith'] = $this.MergeWith
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.MergedStorageName)) { $q['mergedStorageName'] = $this.MergedStorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
