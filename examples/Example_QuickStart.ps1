#requires -Version 7.0
<#
.SYNOPSIS
    Convert a local Excel workbook to PDF — the smallest possible end-to-end sample.

.DESCRIPTION
    Mirrors Python's Example_QuickStart.py:
        instance.convert_spreadsheet(ConvertSpreadsheetRequest('EmployeeSalesSummary.xlsx', 'pdf'),
                                     local_outpath='EmployeeSalesSummary.pdf')

    In PowerShell the SDK returns a RichResponse whose Body holds the converted file;
    Save-Response writes it to examples/output/.

.EXAMPLE
    pwsh -File ./examples/Example_QuickStart.ps1
#>
using module ../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot 'common.ps1')

$client = New-CellsClient

Write-Step 'Converting data/EmployeeSalesSummary.xlsx to PDF'
$request  = [ConvertSpreadsheetRequest]::new((Get-ExampleData 'EmployeeSalesSummary.xlsx'), 'pdf')
$response = $client.Do($request)
$outPath  = Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary.pdf')

Write-Host ''
Write-Host "Done: $outPath" -ForegroundColor Green
