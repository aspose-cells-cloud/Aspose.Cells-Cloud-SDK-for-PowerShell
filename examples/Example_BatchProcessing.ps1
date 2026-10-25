#requires -Version 7.0
<#
.SYNOPSIS
    Batch-convert and batch-split every matching workbook in cloud storage.

.DESCRIPTION
    Mirrors Python's Example_BatchProcessing.py:

        upload CompanySales.xlsx / EmployeeSalesSummary.xlsx to PythonSDK/
        post_batch_convert(BatchConvertRequest(source_folder=..., format='Pdf', ...))
        post_batch_split(BatchSplitRequest(source_folder=...,  format='png', ...))

    Output files stay in cloud storage (PowerShellSDKOutput/). Use
    Management/Example_CloudStorageManagement.ps1 or GetFilesListRequest to inspect them.

.EXAMPLE
    pwsh -File ./examples/Example_BatchProcessing.ps1
#>
using module ../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot 'common.ps1')

$client    = New-CellsClient
$remote    = $ExamplesRemote
$remoteOut = $ExamplesRemoteOut

Write-Step "Uploading sample workbooks to $remote/"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData 'CompanySales.xlsx')         -RemotePath "$remote/CompanySales.xlsx"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData 'EmployeeSalesSummary.xlsx') -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step "Batch-converting every *xlsx in $remote to PDF in $remoteOut"
$matchCondition = [MatchConditionRequest]::new()
$matchCondition.RegexPattern = 'xlsx'

$batchConvert = [BatchConvertRequest]::new()
$batchConvert.SourceFolder   = $remote
$batchConvert.Format         = 'Pdf'
$batchConvert.OutFolder      = $remoteOut
$batchConvert.MatchCondition = $matchCondition

$response = $client.Do([PostBatchConvertRequest]::new($batchConvert))
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Write-Step "Batch-splitting every *xlsx in $remote to PNG in $remoteOut"
$batchSplit = [BatchSplitRequest]::new()
$batchSplit.SourceFolder   = $remote
$batchSplit.Format         = 'png'
$batchSplit.OutFolder      = $remoteOut
$batchSplit.MatchCondition = $matchCondition

$response = $client.Do([PostBatchSplitRequest]::new($batchSplit))
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Write-Host ''
Write-Host "Done. Result files are in cloud folder '$remoteOut'." -ForegroundColor Green
