# AddTextInRemoteSpreadsheetRequest — Specify appending text to multiple cells at once, allowing you to add prefixes, suffixes, labels, or any specific characters. You can choose the exact position of the text—in the beginning, at the end, or before or after certain characters in the cell.
class AddTextInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range
    [string]$Text
    [string]$Position

    [string]$SelectText
    [Nullable[bool]]$SkipEmptyCells
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    AddTextInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range, [string]$text, [string]$position) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($text)) { throw [System.ArgumentException]::new('text is required') }
        if ([string]::IsNullOrEmpty($position)) { throw [System.ArgumentException]::new('position is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
        $this.Text = $text
        $this.Position = $position
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/add/text'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['text'] = $this.Text
        $q['position'] = $this.Position
        if (-not [string]::IsNullOrEmpty($this.SelectText)) { $q['selectText'] = $this.SelectText }
        if ($null -ne $this.SkipEmptyCells) { $q['skipEmptyCells'] = $this.SkipEmptyCells }
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
