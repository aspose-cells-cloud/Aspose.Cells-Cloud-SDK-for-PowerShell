# PostWorksheetPictureRequest — Update a picture by index in the worksheet.
class PostWorksheetPictureRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PictureIndex
    [Picture]$Picture

    [string]$Folder
    [string]$StorageName

    PostWorksheetPictureRequest([string]$name, [string]$sheetName, [int32]$pictureIndex, [Picture]$picture) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $picture) { throw [System.ArgumentException]::new('picture is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PictureIndex = $pictureIndex
        $this.Picture = $picture
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pictures/{pictureIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pictureIndex}', [Uri]::EscapeDataString([string]$this.PictureIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Picture
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
