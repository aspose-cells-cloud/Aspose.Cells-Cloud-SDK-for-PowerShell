# common.ps1 — shared helpers for the Aspose.Cells Cloud PowerShell examples.
#
# Usage (from any example script):
#     using module ../AsposeCellsCloud.psd1      # module path relative to the example
#     . (Join-Path $PSScriptRoot 'common.ps1')   # sub-folder examples use '../common.ps1'
#
# The helper functions are intentionally small: they wrap the three things every sample
# needs and that the SDK itself does not provide (by design):
#   * create an authenticated client from environment variables,
#   * resolve paths inside examples/data and examples/output,
#   * persist a RichResponse body to disk (the SDK returns bytes; it never writes files).

$script:ExamplesRoot       = $PSScriptRoot
$script:ExamplesDataDir    = Join-Path $PSScriptRoot 'data'
$script:ExamplesOutputDir  = Join-Path $PSScriptRoot 'output'
$script:ExamplesRemote     = 'PowerShellSDK'
$script:ExamplesRemoteOut  = 'PowerShellSDKOutput'

# ---------------------------------------------------------------------------
# Client
# ---------------------------------------------------------------------------

function New-CellsClient {
    [CmdletBinding()]
    param(
        [string]$ClientId     = $env:CellsCloudClientId,
        [string]$ClientSecret = $env:CellsCloudClientSecret,
        [string]$BaseUrl      = $env:CellsCloudApiBaseUrl
    )

    if ([string]::IsNullOrEmpty($BaseUrl)) { $BaseUrl = 'https://api.aspose.cloud' }
    if ([string]::IsNullOrEmpty($ClientId) -or [string]::IsNullOrEmpty($ClientSecret)) {
        throw [System.InvalidOperationException]::new(
            'CellsCloudClientId / CellsCloudClientSecret are not set. ' +
            'Get credentials from https://dashboard.aspose.cloud/#/applications, then either ' +
            'set the environment variables or pass -ClientId/-ClientSecret to New-CellsClient.')
    }

    $client = [AsposeCellsCloudClient]::new($ClientId, $ClientSecret, $BaseUrl)
    $client.Timeout = 120   # seconds — the live cloud can be slow
    $client.Retries = 1     # retry transient failures once
    return $client
}

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

function New-ExampleFolder {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
    return $Path
}

function Get-ExampleData {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Name)
    $path = Join-Path $script:ExamplesDataDir $Name
    if (-not (Test-Path -LiteralPath $path)) {
        throw [System.IO.FileNotFoundException]::new("Sample data file not found: $path")
    }
    return (Resolve-Path -LiteralPath $path).ProviderPath
}

function Get-ExampleOutput {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Name)
    New-ExampleFolder $script:ExamplesOutputDir | Out-Null
    $leaf = Split-Path -Path $Name -Leaf
    $dir  = Split-Path -Path $Name -Parent
    if (-not [string]::IsNullOrEmpty($dir)) {
        New-ExampleFolder (Join-Path $script:ExamplesOutputDir $dir) | Out-Null
    }
    return (Join-Path $script:ExamplesOutputDir $Name)
}

# ---------------------------------------------------------------------------
# Response helpers
# ---------------------------------------------------------------------------

# Case-insensitive property lookup that works for PSCustomObject, hashtable and
# .NET objects. The Cloud API returns camelCase JSON; PowerShell's ConvertFrom-Json
# preserves that casing, so $obj.Settings.BuildVersion would not match "settings".
function Get-Prop {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]$InputObject,
        [Parameter(Position = 1, Mandatory)][string]$Name
    )
    if ($null -eq $InputObject) { return $null }

    if ($InputObject -is [System.Collections.IDictionary]) {
        foreach ($key in $InputObject.Keys) {
            if ([string]$key -ieq $Name) { return $InputObject[$key] }
        }
        return $null
    }

    $prop = $InputObject.PSObject.Properties |
        Where-Object { $_.Name -ieq $Name } |
        Select-Object -First 1
    if ($null -ne $prop) { return $prop.Value }
    return $null
}

# Write a RichResponse body to disk. Use for every operation whose response is the
# converted file itself (v4 "local file" endpoints, downloads, split archives, ...).
function Save-Response {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]$Response,
        [Parameter(Mandatory)][string]$Path
    )
    $dir = Split-Path -Path $Path -Parent
    if (-not [string]::IsNullOrEmpty($dir)) { New-ExampleFolder $dir | Out-Null }

    $bytes = $Response.ToBytes()
    if ($null -eq $bytes -or $bytes.Length -eq 0) {
        throw [System.InvalidOperationException]::new("Response for '$Path' has an empty body.")
    }
    [System.IO.File]::WriteAllBytes($Path, $bytes)
    Write-Host ("    saved {0} ({1:N0} bytes)" -f $Path, $bytes.Length)
    return $Path
}

# Write a v3 "FileInfo" JSON response (base64 FileContent) to disk.
function Save-JsonFileContent {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]$Response,
        [Parameter(Mandatory)][string]$Path
    )
    $json    = $Response.GetJson($null)
    $content = Get-Prop $json 'FileContent'
    if ([string]::IsNullOrEmpty([string]$content)) {
        throw [System.InvalidOperationException]::new(
            "Response does not contain a base64 FileContent property. Body: $($Response.ToString())")
    }
    $bytes = [Convert]::FromBase64String([string]$content)
    $dir = Split-Path -Path $Path -Parent
    if (-not [string]::IsNullOrEmpty($dir)) { New-ExampleFolder $dir | Out-Null }
    [System.IO.File]::WriteAllBytes($Path, $bytes)
    Write-Host ("    saved {0} ({1:N0} bytes)" -f $Path, $bytes.Length)
    return $Path
}

function Get-ExampleBase64 {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path)
    return [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($Path))
}

# ---------------------------------------------------------------------------
# Storage helpers
# ---------------------------------------------------------------------------

function Send-CellsUpload {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]$Client,
        [Parameter(Mandatory)][string]$LocalPath,
        [Parameter(Mandatory)][string]$RemotePath,
        [string]$StorageName
    )
    $request = [UploadFileRequest]::new($LocalPath, $RemotePath)
    if (-not [string]::IsNullOrEmpty($StorageName)) { $request.StorageName = $StorageName }
    $null = $Client.Do($request)
    Write-Host "    uploaded $RemotePath"
}

function Receive-CellsDownload {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]$Client,
        [Parameter(Mandatory)][string]$RemotePath,
        [Parameter(Mandatory)][string]$LocalPath,
        [string]$StorageName
    )
    $request = [DownloadFileRequest]::new($RemotePath)
    if (-not [string]::IsNullOrEmpty($StorageName)) { $request.StorageName = $StorageName }
    return Save-Response -Response $Client.Do($request) -Path $LocalPath
}

# ---------------------------------------------------------------------------
# Console
# ---------------------------------------------------------------------------

function Write-Step {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Message)
    Write-Host ''
    Write-Host "==> $Message" -ForegroundColor Cyan
}
