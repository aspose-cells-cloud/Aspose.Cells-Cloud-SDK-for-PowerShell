# TranslateSpreadsheetRequest — Translates the entire spreadsheet to the specified target language.
class TranslateSpreadsheetRequest : RequestOption {
    [string]$Spreadsheet
    [string]$TargetLanguage

    [string]$Region
    [string]$Password

    TranslateSpreadsheetRequest([string]$Spreadsheet, [string]$targetLanguage) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($targetLanguage)) { throw [System.ArgumentException]::new('targetLanguage is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.TargetLanguage = $targetLanguage
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/ai/translate/spreadsheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['targetLanguage'] = $this.TargetLanguage
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
