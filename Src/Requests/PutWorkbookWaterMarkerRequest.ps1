# PutWorkbookWaterMarkerRequest — Set water marker in the workbook.
class PutWorkbookWaterMarkerRequest : RequestOption {
    [string]$Name
    [TextWaterMarkerRequest]$TextWaterMarkerRequest

    [string]$Folder
    [string]$StorageName

    PutWorkbookWaterMarkerRequest([string]$name, [TextWaterMarkerRequest]$textWaterMarkerRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $textWaterMarkerRequest) { throw [System.ArgumentException]::new('textWaterMarkerRequest is required') }
        $this.Name = $name
        $this.TextWaterMarkerRequest = $textWaterMarkerRequest
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/watermarker'
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
        return $this.TextWaterMarkerRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
