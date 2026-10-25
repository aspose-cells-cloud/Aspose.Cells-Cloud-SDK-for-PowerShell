# ConvertRangeToImageRequest — Converts a range of spreadsheet on a local drive to the image file.
class ConvertRangeToImageRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [string]$Range
    [string]$Format

    [Nullable[bool]]$PrintHeadings
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [Nullable[bool]]$AutoRowsFit
    [Nullable[bool]]$AutoColumnsFit
    [string]$Region
    [string]$Password

    ConvertRangeToImageRequest([string]$Spreadsheet, [string]$worksheet, [string]$range, [string]$format) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($format)) { throw [System.ArgumentException]::new('format is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.Range = $range
        $this.Format = $format
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/convert/range/image'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['range'] = $this.Range
        $q['format'] = $this.Format
        if ($null -ne $this.PrintHeadings) { $q['printHeadings'] = $this.PrintHeadings }
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
