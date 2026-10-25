#requires -Version 7.0
<#
.SYNOPSIS
    Export a ListObject (Excel table) as image / PDF / JSON / HTML.

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertTable.py:
      * v3.0 GetWorksheetListObjectRequest (cloud file, by table index)
      * v4.0 ConvertTableTo{Image,Pdf,Json,Html}Request (local file, by table name)

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertTable.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step 'v3.0: GetWorksheetListObject → SVG'
$request = [GetWorksheetListObjectRequest]::new('EmployeeSalesSummary.xlsx', 'SalesChartData', 0)
$request.Format = 'svg'
$request.Folder = $remote
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_SalesChartData_v30.svg') | Out-Null

Write-Step 'v4.0: ConvertTableToPdf → PDF'
$request  = [ConvertTableToPdfRequest]::new($dataFile, 'SalesChartData', 'Table1')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_Table.pdf') | Out-Null

Write-Step 'v4.0: ConvertTableToImage → PNG'
$request  = [ConvertTableToImageRequest]::new($dataFile, 'SalesChartData', 'Table1', 'png')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_Table.png') | Out-Null

Write-Step 'v4.0: ConvertTableToImage → SVG'
$request  = [ConvertTableToImageRequest]::new($dataFile, 'SalesChartData', 'Table1', 'svg')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_Table.svg') | Out-Null

Write-Step 'v4.0: ConvertTableToJson → JSON'
$request  = [ConvertTableToJsonRequest]::new($dataFile, 'SalesChartData', 'Table1')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_Table.json') | Out-Null

Write-Step 'v4.0: ConvertTableToHtml → HTML'
$request  = [ConvertTableToHtmlRequest]::new($dataFile, 'SalesChartData', 'Table1')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Sales_Table.html') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
