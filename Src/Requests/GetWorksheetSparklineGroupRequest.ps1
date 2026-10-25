# GetWorksheetSparklineGroupRequest — Retrieve description of a sparkline group in the worksheet.
class GetWorksheetSparklineGroupRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$SparklineIndex

    [string]$Folder
    [string]$StorageName

    GetWorksheetSparklineGroupRequest([string]$name, [string]$sheetName, [int32]$sparklineIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.SparklineIndex = $sparklineIndex
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/sparklineGroups/{sparklineIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{sparklineIndex}', [Uri]::EscapeDataString([string]$this.SparklineIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
