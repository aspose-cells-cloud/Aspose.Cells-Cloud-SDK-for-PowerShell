# GetPublicKeyRequest — Get an asymmetric public key.
class GetPublicKeyRequest : RequestOption {

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v4.0/cells/publickey'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
