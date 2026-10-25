#requires -Version 7.0
<#
.SYNOPSIS
    List the worksheets in a workbook and convert each one to an HTML table.

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertWorksheetToHtmlTable.py:
      * upload the workbook
      * GetWorksheetsRequest → iterate worksheet links
      * ConvertWorksheetToHtmlTableRequest per sheet → .html

    The cloud JSON is camelCase; Get-Prop performs case-insensitive lookup.

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertWorksheetToHtmlTable.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading EmployeeSalesSummary.xlsx to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

Write-Step 'Reading the worksheet collection'
$request = [GetWorksheetsRequest]::new('EmployeeSalesSummary.xlsx')
$request.Folder = $remote
$response = $client.Do($request)

$worksheets = Get-Prop (Get-Prop ($response.GetJson($null)) 'Worksheets') 'WorksheetList'
if ($null -eq $worksheets) {
    throw 'The workbook does not expose any worksheets.'
}

foreach ($worksheet in $worksheets) {
    $href = [string](Get-Prop (Get-Prop $worksheet 'Link') 'Href')
    $sheetName = $href.TrimStart('/')
    if ([string]::IsNullOrEmpty($sheetName)) { continue }

    Write-Step "Converting worksheet '$sheetName' to an HTML table"
    $request  = [ConvertWorksheetToHtmlTableRequest]::new($dataFile, $sheetName)
    $response = $client.Do($request)
    Save-Response -Response $response `
        -Path (Get-ExampleOutput "EmployeeSalesSummaryToHtmlTable_$sheetName.html") | Out-Null
}

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
