# AddTextRequest — Specify appending text to multiple cells at once, allowing you to add prefixes, suffixes, labels, or any specific characters. You can choose the exact position of the text—in the beginning, at the end, or before or after certain characters in the cell.
class AddTextRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Text
    [string]$Position

    [string]$SelectText
    [Nullable[bool]]$SkipEmptyCells
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    AddTextRequest([string]$Spreadsheet, [string]$text, [string]$position) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($text)) { throw [System.ArgumentException]::new('text is required') }
        if ([string]::IsNullOrEmpty($position)) { throw [System.ArgumentException]::new('position is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Text = $text
        $this.Position = $position
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/add/text'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['text'] = $this.Text
        $q['position'] = $this.Position
        if (-not [string]::IsNullOrEmpty($this.SelectText)) { $q['selectText'] = $this.SelectText }
        if ($null -ne $this.SkipEmptyCells) { $q['skipEmptyCells'] = $this.SkipEmptyCells }
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
