# PutWorksheetAddPictureRequest — Add a new picture in the worksheet.
class PutWorksheetAddPictureRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [Picture]$Picture
    [Nullable[int32]]$UpperLeftRow
    [Nullable[int32]]$UpperLeftColumn
    [Nullable[int32]]$LowerRightRow
    [Nullable[int32]]$LowerRightColumn
    [string]$PicturePath
    [string]$Folder
    [string]$StorageName

    PutWorksheetAddPictureRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pictures'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.UpperLeftRow) { $q['upperLeftRow'] = $this.UpperLeftRow }
        if ($null -ne $this.UpperLeftColumn) { $q['upperLeftColumn'] = $this.UpperLeftColumn }
        if ($null -ne $this.LowerRightRow) { $q['lowerRightRow'] = $this.LowerRightRow }
        if ($null -ne $this.LowerRightColumn) { $q['lowerRightColumn'] = $this.LowerRightColumn }
        if (-not [string]::IsNullOrEmpty($this.PicturePath)) { $q['picturePath'] = $this.PicturePath }
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
