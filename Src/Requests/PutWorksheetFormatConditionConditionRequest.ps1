# PutWorksheetFormatConditionConditionRequest — Add a condition for the format condition in the worksheet.
class PutWorksheetFormatConditionConditionRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Index
    [string]$Type
    [string]$OperatorType
    [string]$Formula1
    [string]$Formula2

    [string]$Folder
    [string]$StorageName

    PutWorksheetFormatConditionConditionRequest([string]$name, [string]$sheetName, [int32]$index, [string]$type, [string]$operatorType, [string]$formula1, [string]$formula2) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($type)) { throw [System.ArgumentException]::new('type is required') }
        if ([string]::IsNullOrEmpty($operatorType)) { throw [System.ArgumentException]::new('operatorType is required') }
        if ([string]::IsNullOrEmpty($formula1)) { throw [System.ArgumentException]::new('formula1 is required') }
        if ([string]::IsNullOrEmpty($formula2)) { throw [System.ArgumentException]::new('formula2 is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Index = $index
        $this.Type = $type
        $this.OperatorType = $operatorType
        $this.Formula1 = $formula1
        $this.Formula2 = $formula2
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/conditionalFormattings/{index}/condition'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{index}', [Uri]::EscapeDataString([string]$this.Index))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
