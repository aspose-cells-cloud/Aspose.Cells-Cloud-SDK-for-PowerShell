# ConvertChartToImageRequest — Converts a chart of spreadsheet on a local drive to image.
class ConvertChartToImageRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [int32]$ChartIndex
    [string]$Format

    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    ConvertChartToImageRequest([string]$Spreadsheet, [string]$worksheet, [int32]$chartIndex, [string]$format) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($format)) { throw [System.ArgumentException]::new('format is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.ChartIndex = $chartIndex
        $this.Format = $format
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/convert/chart/image'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['chartIndex'] = $this.ChartIndex
        $q['format'] = $this.Format
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.FontsLocation)) { $q['fontsLocation'] = $this.FontsLocation }
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
