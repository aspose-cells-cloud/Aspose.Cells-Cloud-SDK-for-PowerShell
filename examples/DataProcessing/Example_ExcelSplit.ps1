#requires -Version 7.0
<#
.SYNOPSIS
    Split a local workbook into per-sheet files and extract the returned ZIP.

.DESCRIPTION
    Mirrors Python's DataProcessing/Example_ExcelSplit.py:
        split_spreadsheet(SplitSpreadsheetRequest(file), local_outpath='split.zip')
        zipfile.ZipFile('split.zip').extractall('.')

.EXAMPLE
    pwsh -File ./examples/DataProcessing/Example_ExcelSplit.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step 'Splitting EmployeeSalesSummary.xlsx'
$request  = [SplitSpreadsheetRequest]::new($dataFile)
$response = $client.Do($request)
$zipPath  = Get-ExampleOutput 'split.zip'
Save-Response -Response $response -Path $zipPath | Out-Null

Write-Step 'Extracting the archive'
$extractDir = Get-ExampleOutput 'split'
New-ExampleFolder $extractDir | Out-Null
Expand-Archive -LiteralPath $zipPath -DestinationPath $extractDir -Force

Get-ChildItem -LiteralPath $extractDir -File | ForEach-Object {
    Write-Host ("    {0} ({1:N0} bytes)" -f $_.Name, $_.Length)
}

Write-Host ''
Write-Host "Done: $extractDir" -ForegroundColor Green
