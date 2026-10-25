# Aspose.Cells Cloud SDK for PowerShell — Examples

Runnable PowerShell translations of the official Python SDK samples
(`aspose-cells-cloud-python/examples`). Each sample is a standalone `.ps1` that talks to the
live Aspose.Cells Cloud API.

Everything a sample needs lives in this folder: the sample data (`data/`), the shared helpers
(`common.ps1`), the runner (`run_examples.ps1`), and the output folder (`output/`, created
on demand).

---

## 1. Prerequisites

| Requirement | Notes |
|-------------|-------|
| **PowerShell 7.0+** | `$PSVersionTable.PSVersion`. The SDK uses native `class`/`enum` and does not work on Windows PowerShell 5.1. |
| **Aspose Cloud credentials** | Client ID + Client Secret from <https://dashboard.aspose.cloud/#/applications>. |
| **Network access** | Samples call `https://api.aspose.cloud`. |

Set the credentials once per shell (the samples read exactly the same variables as the
integration tests):

```powershell
$env:CellsCloudClientId     = '<your client id>'
$env:CellsCloudClientSecret = '<your client secret>'
$env:CellsCloudApiBaseUrl   = 'https://api.aspose.cloud'   # optional, this is the default
```

Verify they are visible:

```powershell
"id=$($env:CellsCloudClientId.Length) secret=$($env:CellsCloudClientSecret.Length)"
```

Or pass them explicitly in a sample:

```powershell
$client = New-CellsClient -ClientId '<id>' -ClientSecret '<secret>'
```

The module is loaded by relative path (`using module ../AsposeCellsCloud.psd1` from this
folder, `../../AsposeCellsCloud.psd1` from a sub-folder), so **no `Install-Module` is needed**
when you run the samples from a source checkout.

---

## 2. Quick start

```powershell
# From the repository root:
pwsh -File ./examples/run_examples.ps1 -List          # see what is available
pwsh -File ./examples/run_examples.ps1 -Name '*QuickStart*'
```

Expected output:

```
==> Converting data/EmployeeSalesSummary.xlsx to PDF
    saved D:\...\examples\output\EmployeeSalesSummary.pdf (182,052 bytes)

Done: D:\...\examples\output\EmployeeSalesSummary.pdf
```

Run a single sample directly (they are ordinary scripts):

```powershell
pwsh -File ./examples/Example_QuickStart.ps1
pwsh -File ./examples/Conversion/Example_ConvertExcel.ps1
```

---

## 3. Layout

```
examples/
├── common.ps1                  # client factory, paths, Save-Response / Save-JsonFileContent
├── run_examples.ps1            # runner (-List, -Category, -Name, -ContinueOnError)
├── data/                       # input workbooks bundled with the samples
│   ├── BookFormula.xlsx
│   ├── BookText.xlsx
│   ├── CompanySales.xlsx
│   └── EmployeeSalesSummary.xlsx
├── output/                     # every generated file lands here (created on demand)
├── Example_QuickStart.ps1
├── Example_BatchProcessing.ps1
├── Example_BigBook.ps1
├── AI/
├── Conversion/
├── DataProcessing/
├── Editor/
├── Management/
├── TextProcessing/
└── Transform/
```

### `common.ps1`

| Helper | Purpose |
|--------|---------|
| `New-CellsClient` | Builds an authenticated `AsposeCellsCloudClient` from the environment variables (or explicit parameters). Sets `Timeout = 120`, `Retries = 1`. |
| `Get-ExampleData <name>` | Resolves a file under `data/`. |
| `Get-ExampleOutput <name>` | Resolves a file under `output/`, creating directories as needed. |
| `Save-Response -Response $r -Path $p` | Writes a `RichResponse.Body` (binary) to disk. |
| `Save-JsonFileContent -Response $r -Path $p` | Decodes a v3 `FileInfo` JSON response (`FileContent` is base64) and writes it. |
| `Get-Prop $obj 'Name'` | Case-insensitive property lookup — the cloud returns camelCase, PowerShell preserves it. |
| `Send-CellsUpload` / `Receive-CellsDownload` | Upload/download helpers. |
| `Write-Step '...'` | Console section header. |
| `$ExamplesRemote` / `$ExamplesRemoteOut` | Cloud folders used by the samples (`PowerShellSDK`, `PowerShellSDKOutput`). |

---

## 4. Samples

### Root

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_QuickStart.ps1` | `ConvertSpreadsheetRequest` — local XLSX → PDF bytes. |
| `Example_BatchProcessing.ps1` | `PostBatchConvertRequest` + `PostBatchSplitRequest` over a cloud folder. |
| `Example_BigBook.ps1` | Upload a large workbook and read `GetWorkbookSettingsRequest`. Uses `data/BigBook.xlsx` when present; otherwise falls back to `EmployeeSalesSummary.xlsx` (the real BigBook is 43 MB and not bundled). |

### AI

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_DecomposeUserTask.ps1` | Natural-language task → generated workbook. |
| `Example_TranslationSpreadsheet.ps1` | `TranslateSpreadsheetRequest` on XLSX and ODS. |
| `Example_TranslationTextFile.ps1` | XLSX → TXT, then `TranslateTextFileRequest`. |

### Conversion

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_ConvertChart.ps1` | `GetWorksheetChartRequest` (v3 cloud) and `ConvertChartTo{Image,Pdf}Request` (v4 local). |
| `Example_ConvertExcel.ps1` | Direct conversion, save-as + download, all six `PostConvertWorkbookTo*` FileInfo endpoints, and advanced `ConvertWorkbookOptions`. |
| `Example_ConvertRange.ps1` | `PostWorksheetCellsRangeToImageRequest` (v3) and `ConvertRangeTo{Image,Pdf,Json,Html}Request` (v4). |
| `Example_ConvertTable.ps1` | `GetWorksheetListObjectRequest` (v3) and `ConvertTableTo{Image,Pdf,Json,Html}Request` (v4). |
| `Example_ConvertWorksheet.ps1` | `ExportSpreadsheetAsFormat`, `ExportWorksheetAsFormat`, `ConvertWorksheetToImage`, `GetWorksheetWithFormat`. |
| `Example_ConvertWorksheetToHtmlTable.ps1` | List worksheets via JSON, convert each to an HTML table. |
| `Example_SaveAs.ps1` | `SaveSpreadsheetAsRequest` with and without `SaveOptionsData`, then download. |

### DataProcessing

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_DataProcessing.ps1` | Batch-split a cloud folder to PNG. |
| `Example_ExcelSplit.ps1` | `SplitSpreadsheetRequest` → ZIP, then `Expand-Archive`. |

### Editor

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_InsertRowInWorksheet.ps1` | `PutInsertWorksheetRowRequest` on a cloud workbook. |
| `Example_TextProcessing.ps1` | Trim + word case in place on a cloud workbook. |

### Management

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_CheckExcel.ps1` | Formula-error checks against a cloud file (`DataSource`) and a local file (`FileInfo` + base64). |
| `Example_CloudStorageManagement.ps1` | `ObjectExists`, create/copy/move/list/delete folders and files. |
| `Example_IO.ps1` | Upload under a generated name, download, verify the SHA-256 round trip. |
| `Example_Management.ps1` | Create workbook, add/rename/move/delete worksheets. |
| `Example_WorkbookOpt.ps1` | Timed upload/download and `GetPageCountRequest`. (Adapted from the Python MSI-timing sample so it runs with the bundled data.) |
| `Example_WorkbookSetting.ps1` | Read workbook settings (build version, author). |

### TextProcessing

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_TextProcessing.ps1` | v3 `PostTrimContentRequest` (Workbook / Worksheet / Selection scopes) and `PostUpdateWordCaseRequest`. |
| `Example_TextProcessing_40.ps1` | The full v4 toolkit: trim, word case, add text, convert text, extract, remove characters, remove duplicates, split. |

### Transform

| Sample | What it demonstrates |
|--------|----------------------|
| `Example_DataCleaning.ps1` | Four-step pipeline: blank columns → blank rows → blank worksheets → duplicates. |

---

## 5. Outputs

All generated files go to `examples/output/` (git-ignored). Samples that operate on cloud
files leave their results in the `PowerShellSDK` / `PowerShellSDKOutput` folders of your
Aspose Cloud storage. The storage-management sample cleans up after itself; the others
overwrite their inputs on each run.

---

## 6. Porting notes (PowerShell vs. Python)

1. **No `local_outpath`.** The PowerShell SDK returns a `RichResponse` with raw `Body`
   bytes. Samples call `Save-Response` (or `Save-JsonFileContent` for v3 `FileInfo`
   responses) to write files.
2. **Required parameters are constructor arguments.** Optional parameters are settable
   properties:
   ```powershell
   $request = [ConvertRangeToImageRequest]::new($file, 'Sales', 'B5:L36', 'png')
   $request.FontsLocation = 'fonts'      # optional
   ```
3. **Request class name.** Python's `TranslationSpreadsheetRequest` is
   `TranslateSpreadsheetRequest` here (the name comes straight from the JSON spec).
4. **No `RemoveExtraSpaces`.** The current spec's `TrimContentOptions` has no
   `RemoveExtraSpaces` property, so that one Python argument is omitted.
5. **`GetJson()` returns a `PSCustomObject`.** Use `Get-Prop` for case-insensitive access;
   `$json.settings.buildVersion` would miss `Settings.BuildVersion`.
6. **Local vs. cloud endpoints.** v3 operations generally read from cloud storage (upload
   first); v4 operations with a `Spreadsheet` parameter read the local file directly.

---

## 7. Troubleshooting

| Symptom | Cause / fix |
|---------|-------------|
| `CellsCloudClientId / CellsCloudClientSecret are not set` | Export the variables in the current shell (§1). |
| `SDKError: HTTP 401` / token `400` | Wrong or expired credentials. |
| `SDKError: HTTP 404` on a cloud operation | The fixture was not uploaded. Samples upload first; check that the previous step succeeded. |
| `using module` error | Run samples with `pwsh -File <script>` from any directory; the module path is relative to the script. |
| Sample hangs / times out | The API can be slow; `New-CellsClient` already uses a 120 s timeout and one retry. |
| Re-running a sample fails because a cloud file exists | Cloud operations overwrite; storage-management is the only sample that asserts non-existence, and it handles both states. |
