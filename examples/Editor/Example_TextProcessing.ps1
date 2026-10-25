#requires -Version 7.0
<#
.SYNOPSIS
    Trim whitespace and change word case in a cloud workbook (in-place edits).

.DESCRIPTION
    Mirrors Python's Editor/Example_TextProcessing.py:
      * TrimCharacterInRemoteSpreadsheetRequest
      * UpdateWordCaseInRemoteSpreadsheetRequest

    Both endpoints edit a workbook that already lives in cloud storage and return a
    JSON status object (not a file).

.EXAMPLE
    pwsh -File ./examples/Editor/Example_TextProcessing.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client    = New-CellsClient
$remote    = $ExamplesRemote
$name      = 'BookText.xlsx'
$worksheet = 'HumanResources'
$range     = 'A1:C12'

Write-Step "Uploading $name to $remote/"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData $name) -RemotePath "$remote/$name"

Write-Step "Trimming leading commas/spaces in $worksheet!$range"
$request = [TrimCharacterInRemoteSpreadsheetRequest]::new($name, $worksheet, $range)
$request.TrimContent  = ',    '
$request.TrimLeading  = $true
$request.Folder       = $remote
$response = $client.Do($request)
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Write-Step "Applying UpperCase to $worksheet!$range"
$request = [UpdateWordCaseInRemoteSpreadsheetRequest]::new($name, $worksheet, $range, 'UpperCase')
$request.Folder = $remote
$response = $client.Do($request)
Write-Host "    HTTP $($response.StatusCode): $($response.ToString())"

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
