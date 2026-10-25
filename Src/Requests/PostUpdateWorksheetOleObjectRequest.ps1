# PostUpdateWorksheetOleObjectRequest — Update an OLE object in worksheet.
class PostUpdateWorksheetOleObjectRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$OleObjectIndex
    [OleObject]$Ole

    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetOleObjectRequest([string]$name, [string]$sheetName, [int32]$oleObjectIndex, [OleObject]$ole) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $ole) { throw [System.ArgumentException]::new('ole is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.OleObjectIndex = $oleObjectIndex
        $this.Ole = $ole
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/oleobjects/{oleObjectIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{oleObjectIndex}', [Uri]::EscapeDataString([string]$this.OleObjectIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Ole
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
