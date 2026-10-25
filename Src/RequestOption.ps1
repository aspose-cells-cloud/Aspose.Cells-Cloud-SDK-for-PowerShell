# RequestOption — the base class every API request derives from.
# Mirrors the Go SDK's request.go RequestOption interface.
class RequestOption {
    [string] GetMethod() {
        throw [System.NotImplementedException]::new('GetMethod must be overridden')
    }

    [string] GetPath() {
        throw [System.NotImplementedException]::new('GetPath must be overridden')
    }

    [hashtable] GetQueryParameters() {
        throw [System.NotImplementedException]::new('GetQueryParameters must be overridden')
    }

    [object] GetJsonBody() {
        return $null
    }

    [hashtable] GetMultipartForm() {
        return @{}
    }
}
