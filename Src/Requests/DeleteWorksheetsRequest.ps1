# DeleteWorksheetsRequest — Delete matched worksheets in the workbook.
class DeleteWorksheetsRequest : RequestOption {
    [string]$Name

    [MatchConditionRequest]$MatchCondition
    [string]$Folder
    [string]$StorageName

    DeleteWorksheetsRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.MatchCondition
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
