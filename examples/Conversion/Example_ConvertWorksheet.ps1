#requires -Version 7.0
<#
.SYNOPSIS
    Export whole workbooks and single worksheets in various formats.

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertWorksheet.py:
      * ExportSpreadsheetAsFormatRequest   — cloud file → csv
      * ExportWorksheetAsFormatRequest     — cloud file, one sheet → pdf
      * ConvertWorksheetToImageRequest     — local file, one sheet → png
      * GetWorksheetWithFormatRequest      — cloud file, page index → png

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertWorksheet.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step 'ExportSpreadsheetAsFormat: cloud XLSX → CSV'
$request = [ExportSpreadsheetAsFormatRequest]::new('EmployeeSalesSummary.xlsx', 'csv')
$request.Folder = $remote
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary.csv') | Out-Null

Write-Step 'ExportWorksheetAsFormat: cloud sheet Sales → PDF'
$request = [ExportWorksheetAsFormatRequest]::new('EmployeeSalesSummary.xlsx', 'Sales', 'pdf')
$request.Folder = $remote
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary2.pdf') | Out-Null

Write-Step 'ConvertWorksheetToImage: local sheet Sales → PNG'
$request  = [ConvertWorksheetToImageRequest]::new($dataFile, 'Sales', 'png')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales.png') | Out-Null

Write-Step 'GetWorksheetWithFormat: cloud sheet Sales, page index 1 → PNG'
$request = [GetWorksheetWithFormatRequest]::new('EmployeeSalesSummary.xlsx', 'Sales')
$request.Format         = 'png'
$request.Folder         = $remote
$request.PageIndex      = 1
$request.PrintHeadings  = $true
$request.OnePagePerSheet = $false
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_PageIndex.png') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
