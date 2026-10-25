#requires -Version 7.0
<#
.SYNOPSIS
    Translate an entire spreadsheet into another language (AI).

.DESCRIPTION
    Mirrors Python's AI/Example_TranslationSpreadsheet.py:

        translation_spreadsheet(TranslationSpreadsheetRequest(file, target_language='zh'), ...)
        convert_spreadsheet(ConvertSpreadsheetRequest(file, 'ods'), ...)
        translation_spreadsheet(TranslationSpreadsheetRequest('EmployeeSalesSummary.ods', 'zh'), ...)

    Note: the Python request class is named TranslationSpreadsheetRequest; in this SDK
    (generated from the JSON spec) the same operation is TranslateSpreadsheetRequest.

.EXAMPLE
    pwsh -File ./examples/AI/Example_TranslationSpreadsheet.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step 'Translating EmployeeSalesSummary.xlsx to Chinese (zh)'
$request  = [TranslateSpreadsheetRequest]::new($dataFile, 'zh')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_zh.xlsx') | Out-Null

Write-Step 'Converting EmployeeSalesSummary.xlsx to ODS'
$request  = [ConvertSpreadsheetRequest]::new($dataFile, 'ods')
$response = $client.Do($request)
$odsPath  = Get-ExampleOutput 'EmployeeSalesSummary.ods'
Save-Response -Response $response -Path $odsPath | Out-Null

Write-Step 'Translating the ODS file to Chinese (zh)'
$request  = [TranslateSpreadsheetRequest]::new($odsPath, 'zh')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_zh_2.ods') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
