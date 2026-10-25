#requires -Version 7.0
<#
.SYNOPSIS
    Measure upload/download throughput and query the page count of a cloud workbook.

.DESCRIPTION
    Adapted from Python's Management/Example_WorkbookOpt.py. The Python sample times an
    upload/download of a local PowerShell MSI; this port keeps the same workflow but uses
    the bundled EmployeeSalesSummary.xlsx so it runs anywhere, and also demonstrates
    GetPageCountRequest (commented out in the Python original).

.EXAMPLE
    pwsh -File ./examples/Management/Example_WorkbookOpt.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$fileName = 'EmployeeSalesSummary.xlsx'
$dataFile = Get-ExampleData $fileName
$remotePath = "$remote/$fileName"

# 1. Timed upload.
Write-Step 'Uploading (timed)'
$start = [System.Diagnostics.Stopwatch]::StartNew()
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath $remotePath
$start.Stop()
Write-Host ("    upload took {0:N2} s" -f $start.Elapsed.TotalSeconds)

# 2. Page count of the cloud workbook.
Write-Step 'Reading the cloud workbook page count'
$request = [GetPageCountRequest]::new($fileName)
$request.Folder = $remote
$response = $client.Do($request)
$pageCount = Get-Prop ($response.GetJson($null)) 'PageCount'
if ($null -eq $pageCount) {
    # Some deployments return a bare number instead of a JSON object.
    $pageCount = $response.ToString().Trim()
}
Write-Host "    page count: $pageCount"

# 3. Timed download.
Write-Step 'Downloading (timed)'
$outPath = Get-ExampleOutput 'EmployeeSalesSummary_WorkbookOpt.xlsx'
$start = [System.Diagnostics.Stopwatch]::StartNew()
Receive-CellsDownload -Client $client -RemotePath $remotePath -LocalPath $outPath | Out-Null
$start.Stop()
Write-Host ("    download took {0:N2} s" -f $start.Elapsed.TotalSeconds)

$sourceHash = (Get-FileHash -LiteralPath $dataFile -Algorithm SHA256).Hash
$destHash   = (Get-FileHash -LiteralPath $outPath  -Algorithm SHA256).Hash
Write-Host "    round-trip identical: $($sourceHash -eq $destHash)"

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
