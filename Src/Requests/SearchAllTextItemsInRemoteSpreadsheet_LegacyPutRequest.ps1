# SearchAllTextItemsInRemoteSpreadsheet_LegacyPutRequest — Deprecated PUT route for String). This endpoint exists only for backward compatibility with clients that used the PUT verb on this read-only route. It will be removed in a future major version.
class SearchAllTextItemsInRemoteSpreadsheet_LegacyPutRequest : RequestOption {
    [string]$Name
    [string]$Folder

    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchAllTextItemsInRemoteSpreadsheet_LegacyPutRequest([string]$name, [string]$folder) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($folder)) { throw [System.ArgumentException]::new('folder is required') }
        $this.Name = $name
        $this.Folder = $folder
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/search/content/all-textitems'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['folder'] = $this.Folder
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
