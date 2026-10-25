# PostWorkbookCalculateFormulaRequest — Calculate all formulas in the workbook.
class PostWorkbookCalculateFormulaRequest : RequestOption {
    [string]$Name

    [CalculationOptions]$Options
    [Nullable[bool]]$IgnoreError
    [string]$Folder
    [string]$StorageName

    PostWorkbookCalculateFormulaRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/calculateformula'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.IgnoreError) { $q['ignoreError'] = $this.IgnoreError }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Options
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
