# GetWorksheetCalculateFormulaRequest — Calculate formula in the worksheet.
class GetWorksheetCalculateFormulaRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Formula

    [string]$Folder
    [string]$StorageName

    GetWorksheetCalculateFormulaRequest([string]$name, [string]$sheetName, [string]$formula) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($formula)) { throw [System.ArgumentException]::new('formula is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Formula = $formula
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/formulaResult'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['formula'] = $this.Formula
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
