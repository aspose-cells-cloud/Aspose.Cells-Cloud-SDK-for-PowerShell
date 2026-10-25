# SearchContentInRemoteWorksheetRequest — Search text in the worksheet of remoted spreadsheet.
class SearchContentInRemoteWorksheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$SearchText

    [Nullable[bool]]$IgnoringCase
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchContentInRemoteWorksheetRequest([string]$name, [string]$worksheet, [string]$searchText) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.SearchText = $searchText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/search/content'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
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
