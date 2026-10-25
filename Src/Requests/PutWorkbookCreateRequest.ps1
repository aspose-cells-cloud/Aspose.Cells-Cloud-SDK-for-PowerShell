# PutWorkbookCreateRequest — Create a new workbook using different methods.
class PutWorkbookCreateRequest : RequestOption {
    [string]$Name

    [string]$TemplateFile
    [string]$DataFile
    [Nullable[bool]]$IsWriteOver
    [string]$Folder
    [string]$StorageName
    [Nullable[bool]]$CheckExcelRestriction

    PutWorkbookCreateRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.TemplateFile)) { $q['templateFile'] = $this.TemplateFile }
        if (-not [string]::IsNullOrEmpty($this.DataFile)) { $q['dataFile'] = $this.DataFile }
        if ($null -ne $this.IsWriteOver) { $q['isWriteOver'] = $this.IsWriteOver }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
