# PostWorkbookSaveAsRequest — Save an Excel file in various formats.
class PostWorkbookSaveAsRequest : RequestOption {
    [string]$Name
    [string]$Newfilename

    [SaveOptions]$SaveOptions
    [Nullable[bool]]$IsAutoFitRows
    [Nullable[bool]]$IsAutoFitColumns
    [string]$Folder
    [string]$StorageName
    [string]$OutStorageName
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region
    [Nullable[bool]]$PageWideFitOnPerSheet
    [Nullable[bool]]$PageTallFitOnPerSheet
    [Nullable[bool]]$OnePagePerSheet
    [string]$FontsLocation

    PostWorkbookSaveAsRequest([string]$name, [string]$newfilename) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($newfilename)) { throw [System.ArgumentException]::new('newfilename is required') }
        $this.Name = $name
        $this.Newfilename = $newfilename
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/SaveAs'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['newfilename'] = $this.Newfilename
        if ($null -ne $this.IsAutoFitRows) { $q['isAutoFitRows'] = $this.IsAutoFitRows }
        if ($null -ne $this.IsAutoFitColumns) { $q['isAutoFitColumns'] = $this.IsAutoFitColumns }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if ($null -ne $this.PageWideFitOnPerSheet) { $q['pageWideFitOnPerSheet'] = $this.PageWideFitOnPerSheet }
        if ($null -ne $this.PageTallFitOnPerSheet) { $q['pageTallFitOnPerSheet'] = $this.PageTallFitOnPerSheet }
        if ($null -ne $this.OnePagePerSheet) { $q['onePagePerSheet'] = $this.OnePagePerSheet }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $this.SaveOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
