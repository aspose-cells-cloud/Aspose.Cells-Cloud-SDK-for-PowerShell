# SearchContentInRemoteRangeRequest — Search text in the range of remoted spreadsheet.
class SearchContentInRemoteRangeRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$CellArea
    [string]$SearchText

    [Nullable[bool]]$IgnoringCase
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    SearchContentInRemoteRangeRequest([string]$name, [string]$worksheet, [string]$cellArea, [string]$searchText) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.CellArea = $cellArea
        $this.SearchText = $searchText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/ranges/{cellArea}/search/content'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{cellArea}', [Uri]::EscapeDataString([string]$this.CellArea))
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
