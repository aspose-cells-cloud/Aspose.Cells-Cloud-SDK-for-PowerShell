# PostSetCellRangeValueRequest — Set the value of the range in the worksheet.
class PostSetCellRangeValueRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Cellarea
    [string]$Value
    [string]$Type

    [string]$Folder
    [string]$StorageName

    PostSetCellRangeValueRequest([string]$name, [string]$sheetName, [string]$cellarea, [string]$value, [string]$type) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellarea)) { throw [System.ArgumentException]::new('cellarea is required') }
        if ([string]::IsNullOrEmpty($value)) { throw [System.ArgumentException]::new('value is required') }
        if ([string]::IsNullOrEmpty($type)) { throw [System.ArgumentException]::new('type is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Cellarea = $cellarea
        $this.Value = $value
        $this.Type = $type
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['cellarea'] = $this.Cellarea
        $q['value'] = $this.Value
        $q['type'] = $this.Type
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
