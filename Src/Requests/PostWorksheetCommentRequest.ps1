# PostWorksheetCommentRequest — Update cell comment in the worksheet.
class PostWorksheetCommentRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellName
    [Comment]$Comment

    [string]$Folder
    [string]$StorageName

    PostWorksheetCommentRequest([string]$name, [string]$sheetName, [string]$cellName, [Comment]$comment) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellName)) { throw [System.ArgumentException]::new('cellName is required') }
        if ($null -eq $comment) { throw [System.ArgumentException]::new('comment is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellName = $cellName
        $this.Comment = $comment
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/comments/{cellName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{cellName}', [Uri]::EscapeDataString([string]$this.CellName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Comment
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
