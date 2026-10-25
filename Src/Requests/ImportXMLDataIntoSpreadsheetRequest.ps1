# ImportXMLDataIntoSpreadsheetRequest — Import XML data file into the local spreadsheet.
class ImportXMLDataIntoSpreadsheetRequest : RequestOption {
    [string]$Datafile
    [string]$Spreadsheet
    [string]$Worksheet
    [string]$Startcell

    [Nullable[bool]]$Insert
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    ImportXMLDataIntoSpreadsheetRequest([string]$datafile, [string]$Spreadsheet, [string]$worksheet, [string]$startcell) {
        if ([string]::IsNullOrEmpty($datafile)) { throw [System.ArgumentException]::new('datafile is required') }
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($startcell)) { throw [System.ArgumentException]::new('startcell is required') }
        $this.Datafile = $datafile
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.Startcell = $startcell
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/import/data/xml'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['startcell'] = $this.Startcell
        if ($null -ne $this.Insert) { $q['insert'] = $this.Insert }
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
        $f['@' + [System.IO.Path]::GetFileName($this.Datafile)] = $this.Datafile
        $f['@' + [System.IO.Path]::GetFileName($this.Spreadsheet)] = $this.Spreadsheet
        return $f
    }
}
