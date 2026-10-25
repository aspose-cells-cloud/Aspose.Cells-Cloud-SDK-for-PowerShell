# GetWorksheetColumnsRequest — Retrieve descriptions of worksheet columns.
class GetWorksheetColumnsRequest : RequestOption {

    [string]$Name
    [string]$SheetName
    [Nullable[int32]]$Offset
    [Nullable[int32]]$Count
    [string]$Folder
    [string]$StorageName

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/columns/'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.Offset) { $q['offset'] = $this.Offset }
        if ($null -ne $this.Count) { $q['count'] = $this.Count }
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
