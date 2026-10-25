#requires -Version 7.0
<#
.SYNOPSIS
    Batch-split every workbook in a cloud folder into PNG files.

.DESCRIPTION
    Mirrors Python's DataProcessing/Example_DataProcessing.py:
      * upload CompanySales.xlsx and EmployeeSalesSummary.xlsx
      * PostBatchSplitRequest(BatchSplitRequest{ SourceFolder, Format='png', OutFolder, MatchCondition })

.EXAMPLE
    pwsh -File ./examples/DataProcessing/Example_DataProcessing.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client    = New-CellsClient
$remote    = $ExamplesRemote
$remoteOut = $ExamplesRemoteOut

Write-Step "Uploading sample workbooks to $remote/"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData 'CompanySales.xlsx')         -RemotePath "$remote/CompanySales.xlsx"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData 'EmployeeSalesSummary.xlsx') -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step "Batch-splitting every *xlsx in $remote to PNG in $remoteOut"
$matchCondition = [MatchConditionRequest]::new()
$matchCondition.RegexPattern = 'xlsx'

$batchSplit = [BatchSplitRequest]::new()
$batchSplit.SourceFolder   = $remote
$batchSplit.Format         = 'png'
$batchSplit.OutFolder      = $remoteOut
$batchSplit.MatchCondition = $matchCondition

$response = $client.Do([PostBatchSplitRequest]::new($batchSplit))
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Write-Host ''
Write-Host "Done. Result files are in cloud folder '$remoteOut'." -ForegroundColor Green
