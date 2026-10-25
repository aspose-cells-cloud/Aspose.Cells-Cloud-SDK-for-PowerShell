# PutWorksheetBackgroundRequest — Set background image in the worksheet.
class PutWorksheetBackgroundRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [string]$PicPath
    [string]$ImageAdaptOption
    [string]$Folder
    [string]$StorageName
    [string]$File

    PutWorksheetBackgroundRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/background'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.PicPath)) { $q['picPath'] = $this.PicPath }
        if (-not [string]::IsNullOrEmpty($this.ImageAdaptOption)) { $q['imageAdaptOption'] = $this.ImageAdaptOption }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        if (-not [string]::IsNullOrEmpty($this.File)) { $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File }
        return $f
    }
}
