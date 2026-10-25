# PostImportDataRequest — Import data into the Excel file.
class PostImportDataRequest : RequestOption {
    [string]$Name

    [ImportOption]$ImportOption
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$FontsLocation

    PostImportDataRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/importdata'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['FontsLocation'] = $this.FontsLocation }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ImportOption
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
