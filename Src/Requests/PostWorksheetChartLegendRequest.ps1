# PostWorksheetChartLegendRequest — Update chart legend in the worksheet.
class PostWorksheetChartLegendRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ChartIndex
    [Legend]$Legend

    [string]$Folder
    [string]$StorageName

    PostWorksheetChartLegendRequest([string]$name, [string]$sheetName, [int32]$chartIndex, [Legend]$legend) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $legend) { throw [System.ArgumentException]::new('legend is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ChartIndex = $chartIndex
        $this.Legend = $legend
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/charts/{chartIndex}/legend'
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
        return $this.Legend
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
