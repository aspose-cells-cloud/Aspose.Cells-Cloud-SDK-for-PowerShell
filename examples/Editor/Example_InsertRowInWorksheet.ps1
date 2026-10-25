#requires -Version 7.0
<#
.SYNOPSIS
    Insert a row into a worksheet of a cloud workbook.

.DESCRIPTION
    Mirrors Python's Editor/Example_InsertRowInWorksheet.py:
        put_insert_worksheet_row(PutInsertWorksheetRowRequest(name, sheet_name, row_index))

    The Python sample assumes the workbook is already in storage. This port uploads the
    bundled fixture first so the example is self-contained.

.EXAMPLE
    pwsh -File ./examples/Editor/Example_InsertRowInWorksheet.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client    = New-CellsClient
$remote    = $ExamplesRemote
$dataFile  = Get-ExampleData 'EmployeeSalesSummary.xlsx'
$name      = 'EmployeeSalesSummary.xlsx'
$worksheet = 'Sales'
$rowIndex  = 1

Write-Step "Uploading $name to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/$name"

try {
    Write-Step "Inserting a row at index $rowIndex in worksheet '$worksheet'"
    $request = [PutInsertWorksheetRowRequest]::new($name, $worksheet, $rowIndex)
    $request.Folder = $remote

    $response = $client.Do($request)
    Write-Host "    API call successful: HTTP $($response.StatusCode)"
    Write-Host "    $($response.ToString())"
}
catch {
    Write-Host "    API call failed: $($_.Exception.Message)" -ForegroundColor Red
    throw
}

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
