# MergeSpreadsheetsRequest — Merge local spreadsheet files into a specified format file.
class MergeSpreadsheetsRequest : RequestOption {
    [string]$Spreadsheet

    [string]$OutFormat
    [Nullable[bool]]$MergeInOneSheet
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    MergeSpreadsheetsRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/merge/spreadsheet'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if ($null -ne $this.MergeInOneSheet) { $q['mergeInOneSheet'] = $this.MergeInOneSheet }
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
