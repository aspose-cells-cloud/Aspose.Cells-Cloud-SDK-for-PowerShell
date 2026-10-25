# Configuration — SDK configuration: base path, version, default headers, credentials.
# Mirrors the Go SDK's configuration.go Configuration type.
class Configuration {
    [string]$BasePath
    [string]$Version
    [string]$Host
    [string]$Scheme
    [hashtable]$DefaultHeader
    [string]$UserAgent
    [string]$ClientId
    [string]$ClientSecret
    [string]$AccessToken
    [Nullable[DateTime]]$GetAccessTokenTime

    Configuration([string]$clientId, [string]$clientSecret, [string]$basePath, [string]$version) {
        $this.BasePath      = 'https://api.aspose.cloud'
        $this.Version       = 'v4.0'
        $this.DefaultHeader = @{}
        $this.UserAgent     = 'Aspose Cells Cloud SDK for PowerShell'
        $this.ClientId      = $clientId
        $this.ClientSecret  = $clientSecret

        if (-not [string]::IsNullOrEmpty($basePath)) {
            $this.BasePath = $basePath.TrimEnd('/')
        }

        # A base path that already carries the version segment sets the version
        # and is stripped back to the bare host (mirrors the Go SDK logic).
        if ($this.BasePath.EndsWith('v3.0')) {
            $this.BasePath = $this.BasePath.Substring(0, $this.BasePath.Length - 5)
            $this.Version  = 'v3.0'
        }
        elseif ($this.BasePath.EndsWith('v1.1')) {
            $this.BasePath = $this.BasePath.Substring(0, $this.BasePath.Length - 5)
            $this.Version  = 'v1.1'
        }

        if (-not [string]::IsNullOrEmpty($version)) {
            $this.Version = $version
        }
    }

    [void] AddDefaultHeader([string]$key, [string]$value) {
        $this.DefaultHeader[$key] = $value
    }
}
