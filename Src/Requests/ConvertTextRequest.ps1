# ConvertTextRequest — Indicates converting the numbers stored as text into the correct number format, replacing unwanted characters and line breaks with the desired characters, and converting accented characters to their equivalent characters without accents.
class ConvertTextRequest : RequestOption {
    [string]$Spreadsheet
    [string]$ConvertTextType

    [string]$SourceCharacters
    [string]$TargetCharacters
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    ConvertTextRequest([string]$Spreadsheet, [string]$convertTextType) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($convertTextType)) { throw [System.ArgumentException]::new('convertTextType is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.ConvertTextType = $convertTextType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/convert/text'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['convertTextType'] = $this.ConvertTextType
        if (-not [string]::IsNullOrEmpty($this.SourceCharacters)) { $q['sourceCharacters'] = $this.SourceCharacters }
        if (-not [string]::IsNullOrEmpty($this.TargetCharacters)) { $q['targetCharacters'] = $this.TargetCharacters }
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.Range)) { $q['range'] = $this.Range }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.Spreadsheet)] = $this.Spreadsheet
        return $f
    }
}
