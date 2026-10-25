# PostWorkbookExportXMLRequest — Export XML data from an Excel file. When there are XML Maps in an Excel file, export XML data. When there is no XML map in the Excel file, convert the Excel file to an XML file.
class PostWorkbookExportXMLRequest : RequestOption {
    [string]$Name

    [string]$Password
    [string]$Folder
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostWorkbookExportXMLRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/exportxml'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
