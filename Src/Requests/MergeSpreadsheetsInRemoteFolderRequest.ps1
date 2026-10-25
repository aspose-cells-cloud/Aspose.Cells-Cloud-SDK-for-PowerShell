# MergeSpreadsheetsInRemoteFolderRequest — Merge spreadsheet files in folder of cloud storage into a specified format file.
class MergeSpreadsheetsInRemoteFolderRequest : RequestOption {
    [string]$Folder

    [string]$FileMatchExpression
    [string]$OutFormat
    [Nullable[bool]]$MergeInOneSheet
    [string]$StorageName
    [string]$OutPath
    [string]$OutStorageName
    [string]$FontsLocation
    [string]$Region
    [string]$Password

    MergeSpreadsheetsInRemoteFolderRequest([string]$folder) {
        if ([string]::IsNullOrEmpty($folder)) { throw [System.ArgumentException]::new('folder is required') }
        $this.Folder = $folder
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/merge/remote-spreadsheets'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['folder'] = $this.Folder
        if (-not [string]::IsNullOrEmpty($this.FileMatchExpression)) { $q['fileMatchExpression'] = $this.FileMatchExpression }
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
