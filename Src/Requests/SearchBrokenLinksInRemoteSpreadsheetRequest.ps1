# SearchBrokenLinksInRemoteSpreadsheetRequest — Search broken links in the remoted spreadsheet.
class SearchBrokenLinksInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name

    [string]$Worksheet
    [string]$CellArea
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchBrokenLinksInRemoteSpreadsheetRequest([string]$name) {
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
