# ConvertTextInRemoteSpreadsheetRequest — Indicates converting the numbers stored as text into the correct number format, replacing unwanted characters and line breaks with the desired characters, and converting accented characters to their equivalent characters without accents.
class ConvertTextInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range
    [string]$ConvertTextType

    [string]$SourceCharacters
    [string]$TargetCharacters
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    ConvertTextInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range, [string]$convertTextType) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($convertTextType)) { throw [System.ArgumentException]::new('convertTextType is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
        $this.ConvertTextType = $convertTextType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/convert/text'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['convertTextType'] = $this.ConvertTextType
        if (-not [string]::IsNullOrEmpty($this.SourceCharacters)) { $q['sourceCharacters'] = $this.SourceCharacters }
        if (-not [string]::IsNullOrEmpty($this.TargetCharacters)) { $q['targetCharacters'] = $this.TargetCharacters }
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
