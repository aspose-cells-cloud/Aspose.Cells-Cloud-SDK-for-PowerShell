# PutWorkbookBackgroundRequest — Set background in the workbook.
class PutWorkbookBackgroundRequest : RequestOption {
    [string]$Name

    [string]$PicPath
    [string]$ImageAdaptOption
    [string]$Folder
    [string]$StorageName
    [string]$File

    PutWorkbookBackgroundRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/background'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
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
