#requires -Version 7.0
<#
.SYNOPSIS
    Bulk-clean text in a cloud workbook using TrimContentOptions / WordCaseOptions.

.DESCRIPTION
    Mirrors Python's TextProcessing/Example_TextProcessing.py:
      * PostTrimContentRequest with scope = Workbook
      * scope = Worksheet (ScopeItems = SDKs)
      * scope = SelectionOlny (Ranges B2:B2, B4:B4)
      * PostUpdateWordCaseRequest with WordCaseOptions (ProperCase)

    Both v3.0 endpoints return a JSON FileInfo whose FileContent is base64.

.EXAMPLE
    pwsh -File ./examples/TextProcessing/Example_TextProcessing.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$fileName = 'BookText.xlsx'

Write-Step "Uploading $fileName to $remote/"
Send-CellsUpload -Client $client -LocalPath (Get-ExampleData $fileName) -RemotePath "$remote/$fileName"

# Shared data source and trim rules.
$dataSource = [DataSource]::new()
$dataSource.DataPath       = "$remote/$fileName"
$dataSource.DataSourceType = 'CloudFileSystem'

$trimOptions = [TrimContentOptions]::new()
$trimOptions.DataSource             = $dataSource
$trimOptions.RemoveAllLineBreaks    = $true
$trimOptions.RemoveExtraLineBreaks  = $true
$trimOptions.TrimLeading            = $true
$trimOptions.TrimTrailing           = $true
$trimOptions.TrimContent            = ' '
$trimOptions.TrimSpaceBetweenWordTo1 = $true
$trimOptions.TrimNonBreakingSpaces  = $true

# 1. Entire workbook.
Write-Step 'Trim: scope = Workbook'
$trimOptions.ScopeOptions = [ScopeOptions]::new()
$trimOptions.ScopeOptions.Scope = 'Workbook'
$response = $client.Do([PostTrimContentRequest]::new($trimOptions))
Save-JsonFileContent -Response $response -Path (Get-ExampleOutput 'BookText_1.xlsx') | Out-Null

# 2. One worksheet.
Write-Step 'Trim: scope = Worksheet (SDKs)'
$scopeItem = [ScopeItem]::new()
$scopeItem.Worksheet = 'SDKs'

$trimOptions.ScopeOptions = [ScopeOptions]::new()
$trimOptions.ScopeOptions.Scope      = 'Worksheet'
$trimOptions.ScopeOptions.ScopeItems = @($scopeItem)
$response = $client.Do([PostTrimContentRequest]::new($trimOptions))
Save-JsonFileContent -Response $response -Path (Get-ExampleOutput 'BookText_2.xlsx') | Out-Null

# 3. Specific cells. ('SelectionOlny' is the API's spelling.)
Write-Step 'Trim: scope = SelectionOlny (SDKs!B2:B2, SDKs!B4:B4)'
$trimOptions.ScopeOptions.Scope = 'SelectionOlny'
$trimOptions.ScopeOptions.ScopeItems[0].Ranges = @('B2:B2', 'B4:B4')
$response = $client.Do([PostTrimContentRequest]::new($trimOptions))
Save-JsonFileContent -Response $response -Path (Get-ExampleOutput 'BookText_3.xlsx') | Out-Null

# 4. Word case over the entire workbook.
Write-Step 'Word case: scope = EntireWorkbook, ProperCase'
$wordCaseOptions = [WordCaseOptions]::new()
$wordCaseOptions.DataSource   = $dataSource
$wordCaseOptions.WordCaseType = 'ProperCase'
$wordCaseOptions.ScopeOptions = [ScopeOptions]::new()
$wordCaseOptions.ScopeOptions.Scope = 'EntireWorkbook'

$response = $client.Do([PostUpdateWordCaseRequest]::new($wordCaseOptions))
Save-JsonFileContent -Response $response -Path (Get-ExampleOutput 'BookText_4.xlsx') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
