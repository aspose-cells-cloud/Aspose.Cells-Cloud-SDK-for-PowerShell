# GetWorksheetWithFormatRequest — Retrieve the worksheet in a specified format from the workbook.
class GetWorksheetWithFormatRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [string]$Format
    [Nullable[int32]]$VerticalResolution
    [Nullable[int32]]$HorizontalResolution
    [string]$Area
    [Nullable[int32]]$PageIndex
    [Nullable[bool]]$OnePagePerSheet
    [Nullable[bool]]$PrintHeadings
    [string]$Folder
    [string]$StorageName

    GetWorksheetWithFormatRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Format)) { $q['format'] = $this.Format }
        if ($null -ne $this.VerticalResolution) { $q['verticalResolution'] = $this.VerticalResolution }
        if ($null -ne $this.HorizontalResolution) { $q['horizontalResolution'] = $this.HorizontalResolution }
        if (-not [string]::IsNullOrEmpty($this.Area)) { $q['area'] = $this.Area }
        if ($null -ne $this.PageIndex) { $q['pageIndex'] = $this.PageIndex }
        if ($null -ne $this.OnePagePerSheet) { $q['onePagePerSheet'] = $this.OnePagePerSheet }
        if ($null -ne $this.PrintHeadings) { $q['printHeadings'] = $this.PrintHeadings }
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
