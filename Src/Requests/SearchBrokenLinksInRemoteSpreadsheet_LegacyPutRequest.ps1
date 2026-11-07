# SearchBrokenLinksInRemoteSpreadsheet_LegacyPutRequest — Deprecated PUT route for String). This endpoint exists only for backward compatibility with clients that used the PUT verb on this read-only route. It will be removed in a future major version.
class SearchBrokenLinksInRemoteSpreadsheet_LegacyPutRequest : RequestOption {
    [string]$Name

    [string]$Worksheet
    [string]$CellArea
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchBrokenLinksInRemoteSpreadsheet_LegacyPutRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/search/broken-links'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.CellArea)) { $q['cellArea'] = $this.CellArea }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
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
