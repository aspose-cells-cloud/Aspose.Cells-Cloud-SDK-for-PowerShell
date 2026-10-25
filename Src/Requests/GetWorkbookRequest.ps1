# GetWorkbookRequest — Retrieve workbooks in various formats.
class GetWorkbookRequest : RequestOption {
    [string]$Name

    [string]$Format
    [string]$Password
    [Nullable[bool]]$IsAutoFit
    [Nullable[bool]]$OnlySaveTable
    [string]$Folder
    [string]$OutPath
    [string]$StorageName
    [string]$OutStorageName
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region
    [Nullable[bool]]$PageWideFitOnPerSheet
    [Nullable[bool]]$PageTallFitOnPerSheet
    [Nullable[bool]]$OnePagePerSheet
    [Nullable[bool]]$OnlyAutofitTable
    [string]$FontsLocation

    GetWorkbookRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Format)) { $q['format'] = $this.Format }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if ($null -ne $this.IsAutoFit) { $q['isAutoFit'] = $this.IsAutoFit }
        if ($null -ne $this.OnlySaveTable) { $q['onlySaveTable'] = $this.OnlySaveTable }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if ($null -ne $this.PageWideFitOnPerSheet) { $q['pageWideFitOnPerSheet'] = $this.PageWideFitOnPerSheet }
        if ($null -ne $this.PageTallFitOnPerSheet) { $q['pageTallFitOnPerSheet'] = $this.PageTallFitOnPerSheet }
        if ($null -ne $this.OnePagePerSheet) { $q['onePagePerSheet'] = $this.OnePagePerSheet }
        if ($null -ne $this.OnlyAutofitTable) { $q['onlyAutofitTable'] = $this.OnlyAutofitTable }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
