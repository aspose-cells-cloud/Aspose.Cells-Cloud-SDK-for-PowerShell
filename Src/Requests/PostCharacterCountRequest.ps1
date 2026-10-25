# PostCharacterCountRequest
class PostCharacterCountRequest : RequestOption {
    [CharacterCountOptions]$CharacterCountOptions

    PostCharacterCountRequest([CharacterCountOptions]$characterCountOptions) {
        if ($null -eq $characterCountOptions) { throw [System.ArgumentException]::new('characterCountOptions is required') }
        $this.CharacterCountOptions = $characterCountOptions
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/charactercount'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.CharacterCountOptions
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
