# PutConvertWorkbookRequest — Convert the workbook from the requested content into files in different formats.
class PutConvertWorkbookRequest : RequestOption {
    [string]$File
    [string]$Format

    [string]$Password
    [string]$OutPath
    [string]$StorageName
    [Nullable[bool]]$CheckExcelRestriction
    [string]$StreamFormat
    [string]$Region
    [Nullable[bool]]$PageWideFitOnPerSheet
    [Nullable[bool]]$PageTallFitOnPerSheet
    [string]$SheetName
    [Nullable[int32]]$PageIndex
    [Nullable[bool]]$OnePagePerSheet
    [Nullable[bool]]$AutoRowsFit
    [Nullable[bool]]$AutoColumnsFit
    [string]$FontsLocation

    PutConvertWorkbookRequest([string]$File, [string]$format) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($format)) { throw [System.ArgumentException]::new('format is required') }
        $this.File = $File
        $this.Format = $format
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v3.0/cells/convert'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['format'] = $this.Format
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.StreamFormat)) { $q['streamFormat'] = $this.StreamFormat }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if ($null -ne $this.PageWideFitOnPerSheet) { $q['pageWideFitOnPerSheet'] = $this.PageWideFitOnPerSheet }
        if ($null -ne $this.PageTallFitOnPerSheet) { $q['pageTallFitOnPerSheet'] = $this.PageTallFitOnPerSheet }
        if (-not [string]::IsNullOrEmpty($this.SheetName)) { $q['sheetName'] = $this.SheetName }
        if ($null -ne $this.PageIndex) { $q['pageIndex'] = $this.PageIndex }
        if ($null -ne $this.OnePagePerSheet) { $q['onePagePerSheet'] = $this.OnePagePerSheet }
        if ($null -ne $this.AutoRowsFit) { $q['AutoRowsFit'] = $this.AutoRowsFit }
        if ($null -ne $this.AutoColumnsFit) { $q['AutoColumnsFit'] = $this.AutoColumnsFit }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File
        return $f
    }
}
