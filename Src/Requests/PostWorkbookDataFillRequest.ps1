# PostWorkbookDataFillRequest — Data filling for spreadsheet files is primarily used to fill empty data in tables and ranges.
class PostWorkbookDataFillRequest : RequestOption {
    [string]$Name
    [DataFill]$DataFill

    [string]$Folder
    [string]$StorageName
    [string]$Password
    [string]$Region
    [Nullable[bool]]$CheckExcelRestriction

    PostWorkbookDataFillRequest([string]$name, [DataFill]$dataFill) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $dataFill) { throw [System.ArgumentException]::new('dataFill is required') }
        $this.Name = $name
        $this.DataFill = $dataFill
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/datafill'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataFill
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
