# AddPictureInCellRequest — add new picture in the cells.
class AddPictureInCellRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellName
    [string]$PicturePath

    [string]$Folder
    [string]$StorageName

    AddPictureInCellRequest([string]$name, [string]$sheetName, [string]$cellName, [string]$picturePath) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellName)) { throw [System.ArgumentException]::new('cellName is required') }
        if ([string]::IsNullOrEmpty($picturePath)) { throw [System.ArgumentException]::new('picturePath is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellName = $cellName
        $this.PicturePath = $picturePath
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pictures/addPictureInCell'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['cellName'] = $this.CellName
        $q['picturePath'] = $this.PicturePath
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
