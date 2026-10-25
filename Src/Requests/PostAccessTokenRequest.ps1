# PostAccessTokenRequest — Get Access Token Result: The Cells Cloud Get Token API acts as a proxy service, forwarding user requests to the Aspose Cloud authentication server and returning the resulting access token to the client.
class PostAccessTokenRequest : RequestOption {

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v4.0/cells/connect/token'
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
