# PutWorksheetOleObjectRequest — Add an OLE object in the worksheet.
class PutWorksheetOleObjectRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [Nullable[int32]]$UpperLeftRow
    [Nullable[int32]]$UpperLeftColumn
    [Nullable[int32]]$Height
    [Nullable[int32]]$Width
    [string]$OleFile
    [string]$ImageFile
    [string]$Folder
    [string]$StorageName

    PutWorksheetOleObjectRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/oleobjects'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.UpperLeftRow) { $q['upperLeftRow'] = $this.UpperLeftRow }
        if ($null -ne $this.UpperLeftColumn) { $q['upperLeftColumn'] = $this.UpperLeftColumn }
        if ($null -ne $this.Height) { $q['height'] = $this.Height }
        if ($null -ne $this.Width) { $q['width'] = $this.Width }
        if (-not [string]::IsNullOrEmpty($this.OleFile)) { $q['oleFile'] = $this.OleFile }
        if (-not [string]::IsNullOrEmpty($this.ImageFile)) { $q['imageFile'] = $this.ImageFile }
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
