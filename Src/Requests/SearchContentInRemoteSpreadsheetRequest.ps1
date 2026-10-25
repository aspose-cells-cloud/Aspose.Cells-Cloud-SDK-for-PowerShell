# SearchContentInRemoteSpreadsheetRequest — Search text in the remoted spreadsheet.
class SearchContentInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$SearchText

    [Nullable[bool]]$IgnoringCase
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchContentInRemoteSpreadsheetRequest([string]$name, [string]$searchText) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        $this.Name = $name
        $this.SearchText = $searchText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/search/content'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['searchText'] = $this.SearchText
        if ($null -ne $this.IgnoringCase) { $q['ignoringCase'] = $this.IgnoringCase }
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
