# ConvertSpreadsheetToCsvRequest — Converts a spreadsheet on a local drive to the csv file.
class ConvertSpreadsheetToCsvRequest : RequestOption {
    [string]$Spreadsheet

    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [Nullable[bool]]$AutoRowsFit
    [Nullable[bool]]$AutoColumnsFit
    [string]$Region
    [string]$Password

    ConvertSpreadsheetToCsvRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/convert/spreadsheet/csv'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.Spreadsheet)] = $this.Spreadsheet
        return $f
    }
}
