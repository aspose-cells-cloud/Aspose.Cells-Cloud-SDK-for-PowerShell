# MergeRemoteSpreadsheetRequest — Merge a spreadsheet file into other spreadsheet in cloud storage, and output a specified format file.
class MergeRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$MergedSpreadsheet

    [string]$Folder
    [string]$OutFormat
    [Nullable[bool]]$MergeInOneSheet
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    MergeRemoteSpreadsheetRequest([string]$name, [string]$mergedSpreadsheet) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($mergedSpreadsheet)) { throw [System.ArgumentException]::new('mergedSpreadsheet is required') }
        $this.Name = $name
        $this.MergedSpreadsheet = $mergedSpreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/merge/spreadsheet'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['mergedSpreadsheet'] = $this.MergedSpreadsheet
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if ($null -ne $this.MergeInOneSheet) { $q['mergeInOneSheet'] = $this.MergeInOneSheet }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
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
        return @{}
    }
}
