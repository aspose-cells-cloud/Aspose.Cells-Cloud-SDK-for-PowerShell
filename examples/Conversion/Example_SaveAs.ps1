#requires -Version 7.0
<#
.SYNOPSIS
    Save a cloud workbook as another cloud file, with and without SaveOptionsData, then download.

.DESCRIPTION
    Mirrors Python's Conversion/Example_SaveAs.py:
      * SaveSpreadsheetAsRequest(name, 'pdf', folder) → download
      * SaveSpreadsheetAsRequest(name, 'pdf', SaveOptionsData{Filename='New_...'}, folder) → download

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_SaveAs.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step 'Saving the cloud workbook as a cloud PDF'
$request = [SaveSpreadsheetAsRequest]::new('EmployeeSalesSummary.xlsx', 'pdf')
$request.Folder = $remote
$response = $client.Do($request)
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Receive-CellsDownload -Client $client -RemotePath "$remote/EmployeeSalesSummary.pdf" `
    -LocalPath (Get-ExampleOutput 'EmployeeSalesSummary3.pdf') | Out-Null

Write-Step 'Saving again with SaveOptionsData (custom file name)'
$saveOptionsData = [SaveOptionsData]::new()
$saveOptionsData.Filename = 'New_EmployeeSalesSummary.pdf'

$request = [SaveSpreadsheetAsRequest]::new('EmployeeSalesSummary.xlsx', 'pdf')
$request.Folder          = $remote
$request.SaveOptionsData = $saveOptionsData
$response = $client.Do($request)

$json   = $response.GetJson($null)
$status = Get-Prop $json 'Status'
if ([string]::IsNullOrEmpty([string]$status)) { $status = "HTTP $($response.StatusCode)" }
Write-Host "    save status: $status"

# The API stores the result at the root because SaveOptionsData carries only a file name.
Receive-CellsDownload -Client $client -RemotePath 'New_EmployeeSalesSummary.pdf' `
    -LocalPath (Get-ExampleOutput 'New_EmployeeSalesSummary.pdf') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
