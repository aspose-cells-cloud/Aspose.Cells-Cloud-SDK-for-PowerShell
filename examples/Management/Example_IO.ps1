#requires -Version 7.0
<#
.SYNOPSIS
    Upload and download a file under a generated name.

.DESCRIPTION
    Mirrors Python's Management/Example_IO.py:
      * copy BookFormula.xlsx to a UUID-named local file and upload it by that name
      * upload BookFormula.xlsx to a remote folder
      * download it again and compare the bytes

.EXAMPLE
    pwsh -File ./examples/Management/Example_IO.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$fileName = 'BookFormula.xlsx'
$dataFile = Get-ExampleData $fileName

# 1. Upload under a generated name (remote name == local file name).
$generatedName = [guid]::NewGuid().ToString() + '.xlsx'
$tempLocal     = Join-Path ([System.IO.Path]::GetTempPath()) $generatedName
Copy-Item -LiteralPath $dataFile -Destination $tempLocal -Force

Write-Step "Uploading a UUID-named copy ($generatedName)"
Send-CellsUpload -Client $client -LocalPath $tempLocal -RemotePath $generatedName

# 2. Upload with an explicit remote folder.
Write-Step "Uploading $fileName to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/$fileName"

# 3. Download it again.
Write-Step 'Downloading the file back'
$downloaded = Receive-CellsDownload -Client $client -RemotePath "$remote/$fileName" `
    -LocalPath (Get-ExampleOutput 'DownloadFile_BookFormula.xlsx')

$sourceHash = (Get-FileHash -LiteralPath $dataFile   -Algorithm SHA256).Hash
$destHash   = (Get-FileHash -LiteralPath $downloaded -Algorithm SHA256).Hash
Write-Host "    round-trip identical: $($sourceHash -eq $destHash)"

# Clean up the generated remote file.
$null = $client.Do([DeleteFileRequest]::new($generatedName))
Remove-Item -LiteralPath $tempLocal -Force

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
