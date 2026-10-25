# GetNamedRangeValueRequest — Retrieve values in range.
class GetNamedRangeValueRequest : RequestOption {
    [string]$Name
    [string]$Namerange

    [string]$Folder
    [string]$StorageName

    GetNamedRangeValueRequest([string]$name, [string]$namerange) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($namerange)) { throw [System.ArgumentException]::new('namerange is required') }
        $this.Name = $name
        $this.Namerange = $namerange
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/ranges/{namerange}/value'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{namerange}', [Uri]::EscapeDataString([string]$this.Namerange))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
