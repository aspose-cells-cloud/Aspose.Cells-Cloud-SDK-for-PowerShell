# PostWorkbookDataCleansingRequest — Data cleaning of spreadsheet files is a data management process used to identify, correct, and remove errors, incompleteness, duplicates, or inaccuracies in tables and ranges.
class PostWorkbookDataCleansingRequest : RequestOption {
    [string]$Name
    [DataCleansing]$DataCleansing

    [string]$Folder
    [string]$StorageName
    [string]$Password
    [string]$Region
    [Nullable[bool]]$CheckExcelRestriction

    PostWorkbookDataCleansingRequest([string]$name, [DataCleansing]$dataCleansing) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $dataCleansing) { throw [System.ArgumentException]::new('dataCleansing is required') }
        $this.Name = $name
        $this.DataCleansing = $dataCleansing
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/datacleansing'
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
        return $this.DataCleansing
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
