#requires -Version 7.0
<#
.SYNOPSIS
    Export a cell range as image / PDF / JSON / HTML.

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertRange.py:
      * v3.0 PostWorksheetCellsRangeToImageRequest (cloud file, RangeConvertRequest body)
      * v4.0 ConvertRangeTo{Image,Pdf,Json,Html}Request (local file)

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertRange.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

# 1. v3.0 — range of a cloud workbook.
Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step 'v3.0: PostWorksheetCellsRangeToImage → SVG'
$sourceRange = [Range]::new()
$sourceRange.ColumnCount = 11
$sourceRange.FirstColumn = 1
$sourceRange.FirstRow    = 25
$sourceRange.RowCount    = 11

$imageOptions = [ImageOrPrintOptions]::new()
$imageOptions.ImageType = 'svg'

$rangeConvertRequest = [RangeConvertRequest]::new()
$rangeConvertRequest.Source                = $sourceRange
$rangeConvertRequest.ImageType             = 'svg'
$rangeConvertRequest.ImageOrPrintOptions   = $imageOptions

$request = [PostWorksheetCellsRangeToImageRequest]::new('EmployeeSalesSummary.xlsx', 'Sales', $rangeConvertRequest)
$request.Folder = $remote
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_v30.svg') | Out-Null

# 2. v4.0 — local workbook, A1-style range.
Write-Step 'v4.0: ConvertRangeToImage → SVG (B28:L36)'
$request  = [ConvertRangeToImageRequest]::new($dataFile, 'Sales', 'B28:L36', 'svg')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_v40.svg') | Out-Null

Write-Step 'v4.0: ConvertRangeToPdf → PDF (B5:L36)'
$request  = [ConvertRangeToPdfRequest]::new($dataFile, 'Sales', 'B5:L36')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_area.pdf') | Out-Null

Write-Step 'v4.0: ConvertRangeToImage → PNG (B5:L36)'
$request  = [ConvertRangeToImageRequest]::new($dataFile, 'Sales', 'B5:L36', 'png')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_area.png') | Out-Null

Write-Step 'v4.0: ConvertRangeToImage → SVG (B5:L36)'
$request  = [ConvertRangeToImageRequest]::new($dataFile, 'Sales', 'B5:L36', 'svg')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_area.svg') | Out-Null

Write-Step 'v4.0: ConvertRangeToJson → JSON (B5:L36)'
$request  = [ConvertRangeToJsonRequest]::new($dataFile, 'Sales', 'B5:L36')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_area.json') | Out-Null

Write-Step 'v4.0: ConvertRangeToHtml → HTML (B5:L36)'
$request  = [ConvertRangeToHtmlRequest]::new($dataFile, 'Sales', 'B5:L36')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_area.html') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
