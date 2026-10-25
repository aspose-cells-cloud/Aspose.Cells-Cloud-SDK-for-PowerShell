#requires -Version 7.0
<#
.SYNOPSIS
    Export a chart as an image (v3 cloud-file API) and as image/PDF (v4 local-file API).

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertChart.py:
      1. upload the workbook, then GetWorksheetChartRequest  → png
      2. ConvertChartToImageRequest (local file)             → png
      3. ConvertChartToPdfRequest   (local file)             → pdf

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertChart.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

# 1. Cells Cloud v3.0 — chart from a cloud workbook.
Write-Step 'v3.0: GetWorksheetChart → PNG'
$request = [GetWorksheetChartRequest]::new('EmployeeSalesSummary.xlsx', 'Sales', 0)
$request.Format = 'png'
$request.Folder = $remote
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_v30.png') | Out-Null

# 2. Cells Cloud v4.0 — chart from a local workbook (no upload needed).
Write-Step 'v4.0: ConvertChartToImage → PNG'
$request  = [ConvertChartToImageRequest]::new($dataFile, 'Sales', 0, 'png')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_v40.png') | Out-Null

Write-Step 'v4.0: ConvertChartToPdf → PDF'
$request  = [ConvertChartToPdfRequest]::new($dataFile, 'Sales', 0)
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_v40.pdf') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
