# PostChartCategoryAxisRequest — Update chart category axis in the chart.
class PostChartCategoryAxisRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ChartIndex
    [Axis]$Axis

    [string]$Folder
    [string]$StorageName

    PostChartCategoryAxisRequest([string]$name, [string]$sheetName, [int32]$chartIndex, [Axis]$axis) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $axis) { throw [System.ArgumentException]::new('axis is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ChartIndex = $chartIndex
        $this.Axis = $axis
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/charts/{chartIndex}/categoryaxis'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{chartIndex}', [Uri]::EscapeDataString([string]$this.ChartIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Axis
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
