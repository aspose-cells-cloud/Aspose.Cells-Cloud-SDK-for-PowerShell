# SplitRemoteSpreadsheetRequest — Split a spreadsheet in cloud storage into the specified format, multi-file.
class SplitRemoteSpreadsheetRequest : RequestOption {
    [string]$Name

    [string]$Folder
    [Nullable[int32]]$From
    [Nullable[int32]]$To
    [string]$OutFormat
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    SplitRemoteSpreadsheetRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/split/spreadsheet'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if ($null -ne $this.From) { $q['from'] = $this.From }
        if ($null -ne $this.To) { $q['to'] = $this.To }
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['fontsLocation'] = $this.FontsLocation }
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
