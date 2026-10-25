# UpdateWordCaseInRemoteSpreadsheetRequest — Specify changing the text case in a remote spreadsheet to switch between uppercase, lowercase, capitalizing the first letter of each word, or capitalizing the first letter of a sentence, and adjust the text according to specific needs.
class UpdateWordCaseInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range
    [string]$WordCaseType

    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    UpdateWordCaseInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range, [string]$wordCaseType) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($wordCaseType)) { throw [System.ArgumentException]::new('wordCaseType is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
        $this.WordCaseType = $wordCaseType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/wordcase'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['wordCaseType'] = $this.WordCaseType
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
