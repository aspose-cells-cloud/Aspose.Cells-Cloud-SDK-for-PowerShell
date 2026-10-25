# UpdateWordCaseRequest — Specify changing the text case in a spreadsheet to switch between uppercase, lowercase, capitalizing the first letter of each word, or capitalizing the first letter of a sentence, and adjust the text according to specific needs.
class UpdateWordCaseRequest : RequestOption {
    [string]$Spreadsheet
    [string]$WordCaseType

    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    UpdateWordCaseRequest([string]$Spreadsheet, [string]$wordCaseType) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($wordCaseType)) { throw [System.ArgumentException]::new('wordCaseType is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.WordCaseType = $wordCaseType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/wordcase'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['wordCaseType'] = $this.WordCaseType
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
