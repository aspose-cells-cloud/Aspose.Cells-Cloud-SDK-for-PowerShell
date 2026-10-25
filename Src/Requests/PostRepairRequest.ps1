# PostRepairRequest — Repair abnormal files and generate files in various formats.
class PostRepairRequest : RequestOption {
    [string]$File

    [string]$OutFormat

    PostRepairRequest([string]$File) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        $this.File = $File
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/repair'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.OutFormat)) { $q['outFormat'] = $this.OutFormat }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File
        return $f
    }
}
