# PutWorksheetChartTitleRequest — Set chart title in the worksheet.
class PutWorksheetChartTitleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ChartIndex

    [Title]$Title
    [string]$Folder
    [string]$StorageName

    PutWorksheetChartTitleRequest([string]$name, [string]$sheetName, [int32]$chartIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ChartIndex = $chartIndex
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/charts/{chartIndex}/title'
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
        return $this.Title
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
