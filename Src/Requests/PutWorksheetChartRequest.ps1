# PutWorksheetChartRequest — Add a new chart in the worksheet.
class PutWorksheetChartRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$ChartType

    [Nullable[int32]]$UpperLeftRow
    [Nullable[int32]]$UpperLeftColumn
    [Nullable[int32]]$LowerRightRow
    [Nullable[int32]]$LowerRightColumn
    [string]$Area
    [Nullable[bool]]$IsVertical
    [string]$CategoryData
    [Nullable[bool]]$IsAutoGetSerialName
    [string]$Title
    [string]$Folder
    [Nullable[bool]]$DataLabels
    [string]$DataLabelsPosition
    [string]$PivotTableSheet
    [string]$PivotTableName
    [string]$StorageName

    PutWorksheetChartRequest([string]$name, [string]$sheetName, [string]$chartType) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($chartType)) { throw [System.ArgumentException]::new('chartType is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ChartType = $chartType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/charts'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['chartType'] = $this.ChartType
        if ($null -ne $this.UpperLeftRow) { $q['upperLeftRow'] = $this.UpperLeftRow }
        if ($null -ne $this.UpperLeftColumn) { $q['upperLeftColumn'] = $this.UpperLeftColumn }
        if ($null -ne $this.LowerRightRow) { $q['lowerRightRow'] = $this.LowerRightRow }
        if ($null -ne $this.LowerRightColumn) { $q['lowerRightColumn'] = $this.LowerRightColumn }
        if (-not [string]::IsNullOrEmpty($this.Area)) { $q['area'] = $this.Area }
        if ($null -ne $this.IsVertical) { $q['isVertical'] = $this.IsVertical }
        if (-not [string]::IsNullOrEmpty($this.CategoryData)) { $q['categoryData'] = $this.CategoryData }
        if ($null -ne $this.IsAutoGetSerialName) { $q['isAutoGetSerialName'] = $this.IsAutoGetSerialName }
        if (-not [string]::IsNullOrEmpty($this.Title)) { $q['title'] = $this.Title }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if ($null -ne $this.DataLabels) { $q['dataLabels'] = $this.DataLabels }
        if (-not [string]::IsNullOrEmpty($this.DataLabelsPosition)) { $q['dataLabelsPosition'] = $this.DataLabelsPosition }
        if (-not [string]::IsNullOrEmpty($this.PivotTableSheet)) { $q['pivotTableSheet'] = $this.PivotTableSheet }
        if (-not [string]::IsNullOrEmpty($this.PivotTableName)) { $q['pivotTableName'] = $this.PivotTableName }
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
