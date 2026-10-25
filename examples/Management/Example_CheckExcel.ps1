#requires -Version 7.0
<#
.SYNOPSIS
    Detect formula errors in a cloud workbook and in a local workbook.

.DESCRIPTION
    Mirrors Python's Management/Example_CheckExcel.py:
      * cloud: DataSource(CloudFileSystem, path) + CheckFormulaErrorOptions
      * local: FileInfo(Filename, base64 FileContent) + CheckFormulaErrorOptions

.EXAMPLE
    pwsh -File ./examples/Management/Example_CheckExcel.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$fileName = 'BookFormula.xlsx'
$dataFile = Get-ExampleData $fileName

Write-Step "Uploading $fileName to $remote/"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/$fileName"

# 1. Cloud workbook.
Write-Step 'Checking formula errors in the cloud workbook'
$dataSource = [DataSource]::new()
$dataSource.DataSourceType = 'CloudFileSystem'
$dataSource.DataPath       = "$remote/$fileName"

$options = [CheckFormulaErrorOptions]::new()
$options.DataSource = $dataSource

$response = $client.Do([CheckWorkbookFormulaErrorsRequest]::new($options))
Write-Host ($response.GetJson($null) | ConvertTo-Json -Depth 8)

# 2. Local workbook.
Write-Step 'Checking formula errors in the local workbook'
$fileInfo = [FileInfo]::new()
$fileInfo.Filename    = $fileName
$fileInfo.FileContent = Get-ExampleBase64 $dataFile

$options = [CheckFormulaErrorOptions]::new()
$options.FileInfo = $fileInfo

$response = $client.Do([CheckWorkbookFormulaErrorsRequest]::new($options))
Write-Host ($response.GetJson($null) | ConvertTo-Json -Depth 8)

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
