# PostWorksheetChartRequest — Update chart properties in the worksheet.
class PostWorksheetChartRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ChartIndex
    [Chart]$Chart

    [string]$Folder
    [string]$StorageName

    PostWorksheetChartRequest([string]$name, [string]$sheetName, [int32]$chartIndex, [Chart]$chart) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $chart) { throw [System.ArgumentException]::new('chart is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ChartIndex = $chartIndex
        $this.Chart = $chart
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/charts/{chartIndex}'
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
        return $this.Chart
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
