# FlipDataRequest — Transposes a specified data range (rows become columns, columns become rows).
class FlipDataRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [string]$CellArea

    [Nullable[bool]]$Horizontal
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    FlipDataRequest([string]$Spreadsheet, [string]$worksheet, [string]$cellArea) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.CellArea = $cellArea
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/flip'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['cellArea'] = $this.CellArea
        if ($null -ne $this.Horizontal) { $q['Horizontal'] = $this.Horizontal }
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
