# RichResponse — unified API response structure.
# Mirrors the Go SDK's response.go RichResponse type.
class RichResponse {
    [int]$StatusCode
    [hashtable]$Headers
    [byte[]]$Body

    RichResponse([int]$statusCode, [hashtable]$headers, [byte[]]$body) {
        $this.StatusCode = $statusCode
        $this.Headers    = $headers
        $this.Body       = $body
    }

    # Parse the response body into a PowerShell object. The [type]$Target parameter
    # is accepted for API parity with the Go SDK but is informational only.
    [object] GetJson([type]$Target) {
        if ($null -eq $this.Body -or $this.Body.Length -eq 0) { return $null }
        return [System.Text.Encoding]::UTF8.GetString($this.Body) | ConvertFrom-Json
    }

    [byte[]] ToBytes() {
        return $this.Body
    }

    [string] ToString() {
        if ($null -eq $this.Body -or $this.Body.Length -eq 0) { return '' }
        return [System.Text.Encoding]::UTF8.GetString($this.Body)
    }
}
