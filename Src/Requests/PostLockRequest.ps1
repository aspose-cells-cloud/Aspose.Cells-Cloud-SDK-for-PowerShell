# PostLockRequest — Lock Excel files.
class PostLockRequest : RequestOption {
    [string]$File
    [string]$Password

    PostLockRequest([string]$File, [string]$password) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ([string]::IsNullOrEmpty($password)) { throw [System.ArgumentException]::new('password is required') }
        $this.File = $File
        $this.Password = $password
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/lock'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['password'] = $this.Password
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
