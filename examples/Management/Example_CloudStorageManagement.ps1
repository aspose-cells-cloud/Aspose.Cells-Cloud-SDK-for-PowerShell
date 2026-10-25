#requires -Version 7.0
<#
.SYNOPSIS
    Exercise the storage API: folders, files, copy, move, list and delete.

.DESCRIPTION
    Mirrors Python's Management/Example_CloudStorageManagement.py, using a dedicated
    remote folder (PowerShellSDKStorage) so it never disturbs the other samples.

.EXAMPLE
    pwsh -File ./examples/Management/Example_CloudStorageManagement.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$root     = 'PowerShellSDKStorage'
$file     = 'CompanySales.xlsx'
$summary  = 'EmployeeSalesSummary.xlsx'

function Test-RemoteObject {
    param($Client, [string]$Path)
    $json = $Client.Do([ObjectExistsRequest]::new($Path)).GetJson($null)
    return [bool](Get-Prop $json 'Exists')
}

Write-Step "Ensuring the '$root' folder exists"
if (-not (Test-RemoteObject $client $root)) {
    $null = $client.Do([CreateFolderRequest]::new($root))
    Write-Host "    created $root"
}

Write-Step "Ensuring $root/$file exists"
if (-not (Test-RemoteObject $client "$root/$file")) {
    Send-CellsUpload -Client $client -LocalPath (Get-ExampleData $file) -RemotePath "$root/$file"

    Write-Step "Creating $root/CellsCloud"
    $null = $client.Do([CreateFolderRequest]::new("$root/CellsCloud"))

    if (Test-RemoteObject $client "$root/CellsCloud") {
        $null = $client.Do([MoveFolderRequest]::new("$root/CellsCloud", "$root/CellsCloud2"))
        Write-Host '    moved CellsCloud → CellsCloud2'
    }

    $null = $client.Do([CopyFileRequest]::new("$root/$file", "$root/CellsCloud/$file"))
    Write-Host '    copied CompanySales.xlsx into CellsCloud'

    Send-CellsUpload -Client $client -LocalPath (Get-ExampleData $summary) -RemotePath "$root/CellsCloud2/$summary"
    $null = $client.Do([CopyFolderRequest]::new("$root/CellsCloud2", "$root/CellsCloud"))
    Write-Host '    copied CellsCloud2 → CellsCloud'

    Write-Step "Listing $root/CellsCloud"
    $request = [GetFilesListRequest]::new()
    $request.Path = "$root/CellsCloud"
    $filesJson = $client.Do($request).GetJson($null)
    $items = Get-Prop $filesJson 'Value'
    if ($null -ne $items) {
        foreach ($storageFile in $items) {
            Write-Host "    $(Get-Prop $storageFile 'Name')"
        }
    }

    Write-Step 'Cleaning up the temporary folders'
    $delete = [DeleteFolderRequest]::new("$root/CellsCloud2")
    $delete.Recursive = $true
    $null = $client.Do($delete)

    $delete = [DeleteFolderRequest]::new("$root/CellsCloud")
    $delete.Recursive = $true
    $null = $client.Do($delete)
    Write-Host '    deleted CellsCloud and CellsCloud2'
}
else {
    Write-Host "    $file already exists — skipping folder exercises."
}

Write-Step "Deleting $root/$file"
$null = $client.Do([DeleteFileRequest]::new("$root/$file"))

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
