# PostWorkbookDataDeduplicationRequest — Data deduplication of spreadsheet files is mainly used to eliminate duplicate data in tables and ranges.
class PostWorkbookDataDeduplicationRequest : RequestOption {
    [string]$Name
    [DeduplicationRegion]$DeduplicationRegion

    [string]$Folder
    [string]$StorageName
    [string]$Password
    [string]$Region
    [Nullable[bool]]$CheckExcelRestriction

    PostWorkbookDataDeduplicationRequest([string]$name, [DeduplicationRegion]$deduplicationRegion) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $deduplicationRegion) { throw [System.ArgumentException]::new('deduplicationRegion is required') }
        $this.Name = $name
        $this.DeduplicationRegion = $deduplicationRegion
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/datadeduplication'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        return $q
    }
    [object] GetJsonBody() {
        return $this.DeduplicationRegion
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
