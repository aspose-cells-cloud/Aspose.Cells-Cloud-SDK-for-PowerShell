#requires -Version 7.0
<#
.SYNOPSIS
    Show every workbook-conversion flavour: direct, save-as + download, FileInfo, advanced options.

.DESCRIPTION
    Mirrors Python's Conversion/Example_ConvertExcel.py:
      * ConvertSpreadsheetRequest                  — local file → local bytes
      * SaveSpreadsheetAsRequest + DownloadFile    — cloud file → cloud file → download
      * PostConvertWorkbookTo{PDF,Json,Docx,PNG,Pptx,Html}Request
                                                   — v3, returns JSON FileInfo with base64 content
      * PostConvertWorkbookRequest                 — advanced (DataSource + PdfSaveOptions)

.EXAMPLE
    pwsh -File ./examples/Conversion/Example_ConvertExcel.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$remote   = $ExamplesRemote
$dataFile = Get-ExampleData 'EmployeeSalesSummary.xlsx'

# 1. v4.0 — local file straight to local bytes.
Write-Step 'ConvertSpreadsheet: local XLSX → PDF'
$request  = [ConvertSpreadsheetRequest]::new($dataFile, 'pdf')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary.pdf') | Out-Null

# 2. Cloud file → cloud file, then download it.
Write-Step "Uploading to $remote/ and saving as a cloud PDF"
Send-CellsUpload -Client $client -LocalPath $dataFile -RemotePath "$remote/EmployeeSalesSummary.xlsx"

$request = [SaveSpreadsheetAsRequest]::new('EmployeeSalesSummary.xlsx', 'pdf')
$request.Folder = $remote
$null = $client.Do($request)

Receive-CellsDownload -Client $client -RemotePath "$remote/EmployeeSalesSummary.pdf" `
    -LocalPath (Get-ExampleOutput 'EmployeeSalesSummary3.pdf') | Out-Null

# 3. v3.0 — each To<Format> endpoint returns a FileInfo JSON object (base64 FileContent).
$v3Conversions = @(
    @{ Name = 'PDF';  Request = [PostConvertWorkbookToPDFRequest]::new($dataFile);  Output = 'EmployeeSalesSummary.pdf'  },
    @{ Name = 'Json'; Request = [PostConvertWorkbookToJsonRequest]::new($dataFile); Output = 'EmployeeSalesSummary.json' },
    @{ Name = 'Docx'; Request = [PostConvertWorkbookToDocxRequest]::new($dataFile); Output = 'EmployeeSalesSummary.docx' },
    @{ Name = 'PNG';  Request = [PostConvertWorkbookToPNGRequest]::new($dataFile);  Output = 'EmployeeSalesSummary.png'  },
    @{ Name = 'Pptx'; Request = [PostConvertWorkbookToPptxRequest]::new($dataFile); Output = 'EmployeeSalesSummary.pptx' },
    @{ Name = 'Html'; Request = [PostConvertWorkbookToHtmlRequest]::new($dataFile); Output = 'EmployeeSalesSummary.html' }
)

foreach ($conversion in $v3Conversions) {
    Write-Step "v3.0: ConvertWorkbookTo$($conversion.Name) → FileInfo (base64)"
    $response = $client.Do($conversion.Request)
    Save-JsonFileContent -Response $response -Path (Get-ExampleOutput $conversion.Output) | Out-Null
}

# 4. Advanced conversion — choose the data source and save options explicitly.
Write-Step 'Advanced: ConvertWorkbookOptions (cloud source + PdfSaveOptions)'
$dataSource = [DataSource]::new()
$dataSource.DataSourceType = 'CloudFileSystem'
$dataSource.DataPath       = "$remote/EmployeeSalesSummary.xlsx"

$pdfSaveOptions = [PdfSaveOptions]::new()
$pdfSaveOptions.SaveFormat      = 'pdf'
$pdfSaveOptions.OnePagePerSheet = $true

$options = [ConvertWorkbookOptions]::new()
$options.DataSource    = $dataSource
$options.ConvertFormat = 'Pdf'
$options.SaveOptions   = $pdfSaveOptions

$response = $client.Do([PostConvertWorkbookRequest]::new($options))
Save-JsonFileContent -Response $response -Path (Get-ExampleOutput 'EmployeeSalesSummary_Advanced.pdf') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
