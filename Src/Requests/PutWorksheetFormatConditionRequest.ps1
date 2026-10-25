# PutWorksheetFormatConditionRequest — Add a format condition in the worksheet.
class PutWorksheetFormatConditionRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Index
    [string]$CellArea
    [string]$Type
    [string]$OperatorType
    [string]$Formula1
    [string]$Formula2

    [string]$Folder
    [string]$StorageName

    PutWorksheetFormatConditionRequest([string]$name, [string]$sheetName, [int32]$index, [string]$cellArea, [string]$type, [string]$operatorType, [string]$formula1, [string]$formula2) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        if ([string]::IsNullOrEmpty($type)) { throw [System.ArgumentException]::new('type is required') }
        if ([string]::IsNullOrEmpty($operatorType)) { throw [System.ArgumentException]::new('operatorType is required') }
        if ([string]::IsNullOrEmpty($formula1)) { throw [System.ArgumentException]::new('formula1 is required') }
        if ([string]::IsNullOrEmpty($formula2)) { throw [System.ArgumentException]::new('formula2 is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Index = $index
        $this.CellArea = $cellArea
        $this.Type = $type
        $this.OperatorType = $operatorType
        $this.Formula1 = $formula1
        $this.Formula2 = $formula2
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/conditionalFormattings/{index}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{index}', [Uri]::EscapeDataString([string]$this.Index))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['cellArea'] = $this.CellArea
        $q['type'] = $this.Type
        $q['operatorType'] = $this.OperatorType
        $q['formula1'] = $this.Formula1
        $q['formula2'] = $this.Formula2
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
