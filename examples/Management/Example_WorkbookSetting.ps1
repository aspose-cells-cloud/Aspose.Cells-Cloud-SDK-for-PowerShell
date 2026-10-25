#requires -Version 7.0
<#
.SYNOPSIS
    Read workbook settings (build version, author, ...) from a cloud workbook.

.DESCRIPTION
    Mirrors Python's Management/Example_WorkbookSetting.py:
        get_workbook_settings(GetWorkbookSettingsRequest('EmployeeSalesSummary.xlsx', folder='PythonSDK'))

.EXAMPLE
    pwsh -File ./examples/Management/Example_WorkbookSetting.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$fileName = 'EmployeeSalesSummary.xlsx'

Write-Step "Uploading $fileName to $remote/"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData $fileName) -RemotePath "$remote/$fileName"

Write-Step 'Reading workbook settings'
$request = [GetWorkbookSettingsRequest]::new($fileName)
$request.Folder = $remote
$response = $client.Do($request)

$json     = $response.GetJson($null)
$settings = Get-Prop $json 'Settings'

Write-Host "    buildVersion: $(Get-Prop $settings 'BuildVersion')"
Write-Host "    author      : $(Get-Prop $settings 'Author')"
Write-Host "    status      : $(Get-Prop $json 'Status')"

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
