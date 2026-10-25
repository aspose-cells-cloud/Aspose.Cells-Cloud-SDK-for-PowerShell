# PostWorkbookImportXMLRequest — Import an XML data file into an Excel file. The XML data file can either be a cloud file or data from an HTTP URI.
class PostWorkbookImportXMLRequest : RequestOption {
    [string]$Name
    [ImportXMLRequest]$ImportXMLRequest

    [string]$Password
    [string]$Folder
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region

    PostWorkbookImportXMLRequest([string]$name, [ImportXMLRequest]$importXMLRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $importXMLRequest) { throw [System.ArgumentException]::new('importXMLRequest is required') }
        $this.Name = $name
        $this.ImportXMLRequest = $importXMLRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/importxml'
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
        return $this.ImportXMLRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
