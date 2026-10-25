# PutWorksheetConditionalFormattingRequest — Add conditional formatting in the worksheet.
class PutWorksheetConditionalFormattingRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [FormatCondition]$Formatcondition
    [string]$CellArea

    [string]$Folder
    [string]$StorageName

    PutWorksheetConditionalFormattingRequest([string]$name, [string]$sheetName, [FormatCondition]$formatcondition, [string]$cellArea) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $formatcondition) { throw [System.ArgumentException]::new('formatcondition is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Formatcondition = $formatcondition
        $this.CellArea = $cellArea
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/conditionalFormattings'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
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
        return $this.Formatcondition
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
