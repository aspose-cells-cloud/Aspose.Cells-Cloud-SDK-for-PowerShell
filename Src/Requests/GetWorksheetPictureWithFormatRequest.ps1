# GetWorksheetPictureWithFormatRequest — Retrieve a picture by number in the worksheet.
class GetWorksheetPictureWithFormatRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PictureNumber
    [string]$Format

    [string]$Folder
    [string]$StorageName

    GetWorksheetPictureWithFormatRequest([string]$name, [string]$sheetName, [int32]$pictureNumber, [string]$format) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($format)) { throw [System.ArgumentException]::new('format is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PictureNumber = $pictureNumber
        $this.Format = $format
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pictures/{pictureNumber}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pictureNumber}', [Uri]::EscapeDataString([string]$this.PictureNumber))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['format'] = $this.Format
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
