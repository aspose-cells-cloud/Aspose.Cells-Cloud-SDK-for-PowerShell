#requires -Version 7.0
<#
.SYNOPSIS
    Convert a workbook to plain text, then translate the text file (AI).

.DESCRIPTION
    Mirrors Python's AI/Example_TranslationTextFile.py:

        convert_spreadsheet(ConvertSpreadsheetRequest(file, 'txt'), ...)
        translate_text_file(TranslateTextFileRequest('EmployeeSalesSummary.txt', 'zh'), ...)

.EXAMPLE
    pwsh -File ./examples/AI/Example_TranslationTextFile.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step 'Converting EmployeeSalesSummary.xlsx to plain text'
$request  = [ConvertSpreadsheetRequest]::new($dataFile, 'txt')
$response = $client.Do($request)
$txtPath  = Get-ExampleOutput 'EmployeeSalesSummary.txt'
Save-Response -Response $response -Path $txtPath | Out-Null

Write-Step 'Translating the text file to Chinese (zh)'
$request  = [TranslateTextFileRequest]::new($txtPath, 'zh')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_zh.txt') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
