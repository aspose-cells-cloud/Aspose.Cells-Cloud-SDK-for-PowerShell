#requires -Version 7.0
<#
.SYNOPSIS
    Upload a large workbook and read its workbook settings.

.DESCRIPTION
    Mirrors Python's Example_BigBook.py (upload BigBook.xlsx → GetWorkbookSettings).

    BigBook.xlsx is 43 MB and is not bundled with this repository. Drop your own copy at
    examples/data/BigBook.xlsx to use it; otherwise the sample falls back to
    EmployeeSalesSummary.xlsx so it still runs.

.EXAMPLE
    pwsh -File ./examples/Example_BigBook.ps1
#>
using module ../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot 'common.ps1')

$client = New-CellsClient
$remote = $ExamplesRemote

$bigBook = Join-Path $ExamplesDataDir 'BigBook.xlsx'
if (-not (Test-Path -LiteralPath $bigBook)) {
    Write-Warning 'examples/data/BigBook.xlsx not found (43 MB, not bundled). Using EmployeeSalesSummary.xlsx instead.'
    $bigBook = Get-ExampleData 'EmployeeSalesSummary.xlsx'
}

$fileName = Split-Path -Path $bigBook -Leaf

Write-Step "Uploading $fileName to $remote/"
Send-CellsUpload -Client $client -LocalPath $bigBook -RemotePath "$remote/$fileName"

Write-Step "Reading workbook settings for $fileName"
$request = [GetWorkbookSettingsRequest]::new($fileName)
$request.Folder = $remote
$response = $client.Do($request)

$settings = Get-Prop ($response.GetJson($null)) 'Settings'
Write-Host "    buildVersion : $(Get-Prop $settings 'BuildVersion')"
Write-Host "    author       : $(Get-Prop $settings 'Author')"

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
