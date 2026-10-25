#requires -Version 7.0
<#
.SYNOPSIS
    Create workbooks and edit worksheet structure, all on local files.

.DESCRIPTION
    Mirrors Python's Management/Example_Management.py:
      * CreateSpreadsheetRequest (blank and from a template)
      * AddWorksheetToSpreadsheetRequest
      * RenameWorksheetInSpreadsheetRequest
      * MoveWorksheetInSpreadsheetRequest
      * DeleteWorksheetFromSpreadsheetRequest

    Each v4 "local file" endpoint takes a local workbook and returns the edited workbook
    as the response body; the chain feeds one output into the next input.

.EXAMPLE
    pwsh -File ./examples/Management/Example_Management.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

# 1. Create a blank workbook.
Write-Step 'Creating a blank XLSB workbook'
$request = [CreateSpreadsheetRequest]::new()
$request.Format = 'xlsb'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'blank_spreadsheet.xlsb') | Out-Null

# 2. Create a workbook from a built-in template.
Write-Step 'Creating a workbook from the SalesDataComparisonXLSX template'
$request = [CreateSpreadsheetRequest]::new()
$request.Format   = 'xlsb'
$request.Template = 'SalesDataComparisonXLSX'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'SalesDataComparison.xlsb') | Out-Null

# 3. Add a worksheet.
Write-Step 'Adding worksheet NewSalesData'
$request = [AddWorksheetToSpreadsheetRequest]::new($dataFile)
$request.Position  = 0
$request.SheetName = 'NewSalesData'
$addedPath = Get-ExampleOutput 'EmployeeSalesSummary_AddNewSalesData.xlsx'
Save-Response -Response $client.Do($request) -Path $addedPath | Out-Null

# 4. Rename the new worksheet.
Write-Step 'Renaming NewSalesData → 2025SalesData'
$request = [RenameWorksheetInSpreadsheetRequest]::new($addedPath, 'NewSalesData', '2025SalesData')
$renamedPath = Get-ExampleOutput 'EmployeeSalesSummary_RenameNewSalesData.xlsx'
Save-Response -Response $client.Do($request) -Path $renamedPath | Out-Null

# 5. Move the worksheet.
Write-Step 'Moving 2025SalesData to position 2'
$request = [MoveWorksheetInSpreadsheetRequest]::new($renamedPath, '2025SalesData', 2)
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'EmployeeSalesSummary_MoveNewSalesData.xlsx') | Out-Null

# 6. Delete the worksheet.
Write-Step 'Deleting 2025SalesData'
$request = [DeleteWorksheetFromSpreadsheetRequest]::new($renamedPath, '2025SalesData')
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'EmployeeSalesSummary_DeleteNewSalesData.xlsx') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
