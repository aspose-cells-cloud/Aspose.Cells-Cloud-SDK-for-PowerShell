# PutWorksheetShapeRequest — Add a shape in the worksheet.
class PutWorksheetShapeRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [Shape]$ShapeDTO
    [string]$DrawingType
    [Nullable[int32]]$UpperLeftRow
    [Nullable[int32]]$UpperLeftColumn
    [Nullable[int32]]$Top
    [Nullable[int32]]$Left
    [Nullable[int32]]$Width
    [Nullable[int32]]$Height
    [string]$Folder
    [string]$StorageName

    PutWorksheetShapeRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/shapes'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.DrawingType)) { $q['DrawingType'] = $this.DrawingType }
        if ($null -ne $this.UpperLeftRow) { $q['upperLeftRow'] = $this.UpperLeftRow }
        if ($null -ne $this.UpperLeftColumn) { $q['upperLeftColumn'] = $this.UpperLeftColumn }
        if ($null -ne $this.Top) { $q['top'] = $this.Top }
        if ($null -ne $this.Left) { $q['left'] = $this.Left }
        if ($null -ne $this.Width) { $q['width'] = $this.Width }
        if ($null -ne $this.Height) { $q['height'] = $this.Height }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ShapeDTO
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
