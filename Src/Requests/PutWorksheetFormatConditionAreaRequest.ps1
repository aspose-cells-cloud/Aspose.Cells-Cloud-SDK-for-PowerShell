# PutWorksheetFormatConditionAreaRequest — Add a cell area for the format condition in the worksheet.
class PutWorksheetFormatConditionAreaRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Index
    [string]$CellArea

    [string]$Folder
    [string]$StorageName

    PutWorksheetFormatConditionAreaRequest([string]$name, [string]$sheetName, [int32]$index, [string]$cellArea) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Index = $index
        $this.CellArea = $cellArea
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/conditionalFormattings/{index}/area'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{index}', [Uri]::EscapeDataString([string]$this.Index))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['cellArea'] = $this.CellArea
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
