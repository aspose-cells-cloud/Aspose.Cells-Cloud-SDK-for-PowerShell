# PostMetadataRequest — Update document properties in Excel file, and save them is various formats.
class PostMetadataRequest : RequestOption {
    [string]$File
    [CellsDocumentProperty[]]$CellsDocuments

    [string]$Password
    [Nullable[bool]]$CheckExcelRestriction
    [string]$OutFormat
    [string]$Region

    PostMetadataRequest([string]$File, [CellsDocumentProperty[]]$cellsDocuments) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        $this.File = $File
        $this.CellsDocuments = $cellsDocuments
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/metadata/update'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        if ($null -ne $this.CheckExcelRestriction) { $q['checkExcelRestriction'] = $this.CheckExcelRestriction }
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        return $q
    }
    [object] GetJsonBody() {
        return $this.CellsDocuments
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File
        return $f
    }
}
