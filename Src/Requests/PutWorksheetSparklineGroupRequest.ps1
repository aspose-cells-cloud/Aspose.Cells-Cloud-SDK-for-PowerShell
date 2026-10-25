# PutWorksheetSparklineGroupRequest — Add a sparkline group in the worksheet.
class PutWorksheetSparklineGroupRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Type
    [string]$DataRange
    [bool]$IsVertical
    [string]$LocationRange

    [string]$Folder
    [string]$StorageName

    PutWorksheetSparklineGroupRequest([string]$name, [string]$sheetName, [string]$type, [string]$dataRange, [bool]$isVertical, [string]$locationRange) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($type)) { throw [System.ArgumentException]::new('type is required') }
        if ([string]::IsNullOrEmpty($dataRange)) { throw [System.ArgumentException]::new('dataRange is required') }
        if ([string]::IsNullOrEmpty($locationRange)) { throw [System.ArgumentException]::new('locationRange is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Type = $type
        $this.DataRange = $dataRange
        $this.IsVertical = $isVertical
        $this.LocationRange = $locationRange
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/sparklineGroups'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['type'] = $this.Type
        $q['dataRange'] = $this.DataRange
        $q['isVertical'] = $this.IsVertical
        $q['locationRange'] = $this.LocationRange
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
