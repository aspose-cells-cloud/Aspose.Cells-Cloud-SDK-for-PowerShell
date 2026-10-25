# SwapRangeRequest — The Swap Ranges for Excel API provides a powerful tool to move any two columns, rows, ranges, or individual cells within an Excel file. This API allows users to re-arrange their tables quickly and efficiently, ensuring that the original data formatting is preserved and all existing formulas continue to function correctly. By leveraging this API, users can streamline their data manipulation tasks and maintain the integrity of their spreadsheets.
class SwapRangeRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet1
    [string]$Range1
    [string]$Worksheet2
    [string]$Range2

    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    SwapRangeRequest([string]$Spreadsheet, [string]$worksheet1, [string]$range1, [string]$worksheet2, [string]$range2) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet1)) { throw [System.ArgumentException]::new('worksheet1 is required') }
        if ([string]::IsNullOrEmpty($range1)) { throw [System.ArgumentException]::new('range1 is required') }
        if ([string]::IsNullOrEmpty($worksheet2)) { throw [System.ArgumentException]::new('worksheet2 is required') }
        if ([string]::IsNullOrEmpty($range2)) { throw [System.ArgumentException]::new('range2 is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet1 = $worksheet1
        $this.Range1 = $range1
        $this.Worksheet2 = $worksheet2
        $this.Range2 = $range2
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/swap/range'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet1'] = $this.Worksheet1
        $q['range1'] = $this.Range1
        $q['worksheet2'] = $this.Worksheet2
        $q['range2'] = $this.Range2
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
