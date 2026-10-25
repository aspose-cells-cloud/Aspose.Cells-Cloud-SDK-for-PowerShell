# ReplaceContentInRemoteSpreadsheetRequest — Replace text in the remoted spreadsheet.
class ReplaceContentInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$SearchText
    [string]$ReplaceText

    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    ReplaceContentInRemoteSpreadsheetRequest([string]$name, [string]$searchText, [string]$replaceText) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($searchText)) { throw [System.ArgumentException]::new('searchText is required') }
        if ([string]::IsNullOrEmpty($replaceText)) { throw [System.ArgumentException]::new('replaceText is required') }
        $this.Name = $name
        $this.SearchText = $searchText
        $this.ReplaceText = $replaceText
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/replace/content'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['searchText'] = $this.SearchText
        $q['replaceText'] = $this.ReplaceText
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
