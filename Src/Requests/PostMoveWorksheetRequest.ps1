# PostMoveWorksheetRequest — Move worksheet in the workbook.
class PostMoveWorksheetRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [WorksheetMovingRequest]$Moving

    [string]$Folder
    [string]$StorageName

    PostMoveWorksheetRequest([string]$name, [string]$sheetName, [WorksheetMovingRequest]$moving) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $moving) { throw [System.ArgumentException]::new('moving is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Moving = $moving
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/position'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Moving
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
