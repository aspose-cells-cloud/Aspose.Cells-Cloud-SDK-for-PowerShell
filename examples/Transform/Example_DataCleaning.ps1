#requires -Version 7.0
<#
.SYNOPSIS
    Clean a workbook step by step: blank columns → blank rows → blank sheets → duplicates.

.DESCRIPTION
    Mirrors Python's Transform/Example_DataCleaning.py. The Python sample writes every step
    back to the same TempBookText.xlsx; this port writes a numbered intermediate file per
    step so the pipeline is easy to inspect.

.EXAMPLE
    pwsh -File ./examples/Transform/Example_DataCleaning.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$source   = Get-ExampleData 'BookText.xlsx'

Write-Step 'Step 1/4: remove blank columns'
$request = [RemoveSpreadsheetBlankColumnsRequest]::new($source)
$step1   = Get-ExampleOutput 'TempBookText_1.xlsx'
Save-Response -Response $client.Do($request) -Path $step1 | Out-Null

Write-Step 'Step 2/4: remove blank rows'
$request = [RemoveSpreadsheetBlankRowsRequest]::new($step1)
$step2   = Get-ExampleOutput 'TempBookText_2.xlsx'
Save-Response -Response $client.Do($request) -Path $step2 | Out-Null

Write-Step 'Step 3/4: remove blank worksheets'
$request = [RemoveSpreadsheetBlankWorksheetsRequest]::new($step2)
$step3   = Get-ExampleOutput 'TempBookText_3.xlsx'
Save-Response -Response $client.Do($request) -Path $step3 | Out-Null

Write-Step 'Step 4/4: remove duplicate rows'
$request = [RemoveDuplicatesRequest]::new($step3)
$step4   = Get-ExampleOutput 'TempBookText_4.xlsx'
Save-Response -Response $client.Do($request) -Path $step4 | Out-Null

Write-Host ''
Write-Host "Done: $step4" -ForegroundColor Green
