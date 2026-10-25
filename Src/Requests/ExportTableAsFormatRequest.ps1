# ExportTableAsFormatRequest — Converts a table of spreadsheet in cloud storage to the specified format.
class ExportTableAsFormatRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$TableName
    [string]$Format

    [string]$Folder
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [Nullable[bool]]$AutoRowsFit
    [Nullable[bool]]$AutoColumnsFit
    [string]$Region
    [string]$Password

    ExportTableAsFormatRequest([string]$name, [string]$worksheet, [string]$tableName, [string]$format) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($tableName)) { throw [System.ArgumentException]::new('tableName is required') }
        if ([string]::IsNullOrEmpty($format)) { throw [System.ArgumentException]::new('format is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.TableName = $tableName
        $this.Format = $format
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/tables/{tableName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{tableName}', [Uri]::EscapeDataString([string]$this.TableName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['format'] = $this.Format
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['fontsLocation'] = $this.FontsLocation }
        if ($null -ne $this.AutoRowsFit) { $q['AutoRowsFit'] = $this.AutoRowsFit }
        if ($null -ne $this.AutoColumnsFit) { $q['AutoColumnsFit'] = $this.AutoColumnsFit }
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
