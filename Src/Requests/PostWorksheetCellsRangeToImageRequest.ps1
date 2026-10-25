# PostWorksheetCellsRangeToImageRequest
class PostWorksheetCellsRangeToImageRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [RangeConvertRequest]$RangeConvertRequest

    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeToImageRequest([string]$name, [string]$sheetName, [RangeConvertRequest]$rangeConvertRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $rangeConvertRequest) { throw [System.ArgumentException]::new('rangeConvertRequest is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RangeConvertRequest = $rangeConvertRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/convertToImage'
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
        return $this.RangeConvertRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
