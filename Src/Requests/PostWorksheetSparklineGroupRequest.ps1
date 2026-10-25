# PostWorksheetSparklineGroupRequest — Update a sparkline group in the worksheet.
class PostWorksheetSparklineGroupRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$SparklineGroupIndex
    [SparklineGroup]$SparklineGroup

    [string]$Folder
    [string]$StorageName

    PostWorksheetSparklineGroupRequest([string]$name, [string]$sheetName, [int32]$sparklineGroupIndex, [SparklineGroup]$sparklineGroup) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $sparklineGroup) { throw [System.ArgumentException]::new('sparklineGroup is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.SparklineGroupIndex = $sparklineGroupIndex
        $this.SparklineGroup = $sparklineGroup
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/sparklineGroups/{sparklineGroupIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{sparklineGroupIndex}', [Uri]::EscapeDataString([string]$this.SparklineGroupIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.SparklineGroup
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
