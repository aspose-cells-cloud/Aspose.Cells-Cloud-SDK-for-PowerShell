#requires -Version 7.0
<#
.SYNOPSIS
    Tour the v4.0 text-processing endpoints: trim, word case, add, convert, extract, remove, split.

.DESCRIPTION
    Mirrors Python's TextProcessing/Example_TextProcessing_40.py. Every operation takes a
    LOCAL workbook and returns the processed workbook as the response body.

    Note: ConvertTextRequest in this SDK takes (Spreadsheet, ConvertTextType) in the
    constructor; the optional source/target characters and range are properties.

.EXAMPLE
    pwsh -File ./examples/TextProcessing/Example_TextProcessing_40.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client   = New-CellsClient
$dataFile = Get-ExampleData 'BookText.xlsx'

# --- Trim ---------------------------------------------------------------
Write-Step 'out1: trim HumanResources!A1:C12, collapse spaces between words'
$request = [TrimCharacterRequest]::new($dataFile)
$request.Worksheet             = 'HumanResources'
$request.Range                 = 'A1:C12'
$request.TrimSpaceBetweenWordTo1 = $true
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out1.xlsx') | Out-Null

Write-Step 'out2: trim Text!J6:J6, leading spaces only'
$request = [TrimCharacterRequest]::new($dataFile)
$request.Worksheet             = 'Text'
$request.Range                 = 'J6:J6'
$request.TrimTrailing          = $false
$request.TrimSpaceBetweenWordTo1 = $true
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out2.xlsx') | Out-Null

Write-Step 'out3: trim Text!J7:J7 and remove all line breaks'
$request = [TrimCharacterRequest]::new($dataFile)
$request.Worksheet             = 'Text'
$request.Range                 = 'J7:J7'
$request.TrimTrailing          = $false
$request.TrimSpaceBetweenWordTo1 = $true
$request.RemoveAllLineBreaks   = $true
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out3.xlsx') | Out-Null

# --- Word case ----------------------------------------------------------
Write-Step 'out4: Uppercase Text!J7:J7'
$request = [UpdateWordCaseRequest]::new($dataFile, 'UpperCase')
$request.Worksheet = 'Text'
$request.Range     = 'J7:J7'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out4.xlsx') | Out-Null

Write-Step 'out5: Lowercase Text!J7:J7'
$request = [UpdateWordCaseRequest]::new((Get-ExampleOutput 'out4.xlsx'), 'LowerCase')
$request.Worksheet = 'Text'
$request.Range     = 'J7:J7'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out5.xlsx') | Out-Null

Write-Step 'out6: ProperCase Text!J7:J7'
$request = [UpdateWordCaseRequest]::new((Get-ExampleOutput 'out5.xlsx'), 'ProperCase')
$request.Worksheet = 'Text'
$request.Range     = 'J7:J7'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out6.xlsx') | Out-Null

Write-Step 'out7: SentenceCase Text!J7:J7'
$request = [UpdateWordCaseRequest]::new((Get-ExampleOutput 'out5.xlsx'), 'SentenceCase')
$request.Worksheet = 'Text'
$request.Range     = 'J7:J7'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out7.xlsx') | Out-Null

# --- Add text -----------------------------------------------------------
Write-Step 'out8: prefix every string with "Aspose.Cells"'
$request = [AddTextRequest]::new($dataFile, 'Aspose.Cells', 'AtTheBeginning')
$request.SelectText = ''
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out8.xlsx') | Out-Null

Write-Step 'out9: insert "!" after "hello world"'
$request = [AddTextRequest]::new($dataFile, '!', 'AfterText')
$request.SelectText = 'hello world'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out9.xlsx') | Out-Null

Write-Step 'out10: append "!" to Text!A1:J7 (including empty cells)'
$request = [AddTextRequest]::new($dataFile, '!', 'AtTheEnd')
$request.Worksheet      = 'Text'
$request.Range          = 'A1:J7'
$request.SkipEmptyCells = $false
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out10.xlsx') | Out-Null

# --- Convert text -------------------------------------------------------
Write-Step 'out11: convert all numbers to text'
$request = [ConvertTextRequest]::new($dataFile, 'ConvertNumberToText')
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out11.xlsx') | Out-Null

Write-Step 'out12: replace "1" with "Aspose.Cells" in Text!C9:F13'
$request = [ConvertTextRequest]::new((Get-ExampleOutput 'out11.xlsx'), 'ConvertCharacters')
$request.SourceCharacters = '1'
$request.TargetCharacters = 'Aspose.Cells'
$request.Worksheet        = 'Text'
$request.Range            = 'C9:F13'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out12.xlsx') | Out-Null

Write-Step 'out13: replace line breaks'
$request = [ConvertTextRequest]::new((Get-ExampleOutput 'out12.xlsx'), 'ConvertLinebreak')
$request.TargetCharacters = 'Linebreak'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out13.xlsx') | Out-Null

Write-Step 'out14: replace white space'
$request = [ConvertTextRequest]::new((Get-ExampleOutput 'out13.xlsx'), 'ConvertWriteSpace')
$request.TargetCharacters = 'WriteSpace'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out14.xlsx') | Out-Null

# --- Extract text -------------------------------------------------------
Write-Step 'out15: extract text before ";" from HumanResources!G2:G11 into H2:H11'
$request = [ExtractTextRequest]::new($dataFile, 'ExtractTextBefore', 'H2:H11')
$request.BeforeText = ';'
$request.Worksheet  = 'HumanResources'
$request.Range      = 'G2:G11'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out15.xlsx') | Out-Null

# --- Remove characters --------------------------------------------------
Write-Step 'out16: remove every occurrence of "Aspose"'
$request = [RemoveCharactersRequest]::new($dataFile)
$request.RemoveTextMethod  = 'RemoveSubString'
$request.CharacterSets     = 'Aspose'
$request.RemoveCustomValue = 'Aspose'
$request.CaseSensitive     = $false
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out16.xlsx') | Out-Null

Write-Step 'out17: remove everything before "you" and after "Aspose" (case-insensitive)'
$request = [RemoveCharactersByPositionRequest]::new($dataFile)
$request.Worksheet              = 'Text'
$request.AllCharactersBeforeText = 'you'
$request.AllCharactersAfterText  = 'Aspose'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out17.xlsx') | Out-Null

Write-Step 'out18: same, case-sensitive'
$request = [RemoveCharactersByPositionRequest]::new($dataFile)
$request.Worksheet              = 'Text'
$request.AllCharactersBeforeText = 'you'
$request.AllCharactersAfterText  = 'Aspose'
$request.CaseSensitive          = $true
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out18.xlsx') | Out-Null

Write-Step 'out19: remove duplicate ";"-separated substrings'
$request = [RemoveDuplicateSubstringsRequest]::new($dataFile, ';')
$request.Worksheet = 'Text'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out19.xlsx') | Out-Null

Write-Step 'out20: same, case-sensitive'
$request = [RemoveDuplicateSubstringsRequest]::new($dataFile, ';')
$request.Worksheet    = 'Text'
$request.CaseSensitive = $true
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out20.xlsx') | Out-Null

# --- Split text ---------------------------------------------------------
Write-Step 'out21: split HumanResources!G2:G11 on ";" into H2:H11'
$request = [SplitTextRequest]::new($dataFile, ';')
$request.Worksheet                   = 'HumanResources'
$request.HowToSplit                  = 'SplitToColumns'
$request.OutPositionRange            = 'H2:H11'
$request.Range                       = 'G2:G11'
$request.KeepDelimitersInResultingCells = $true
$request.KeepDelimitersPosition      = 'AtTheBeginning'
Save-Response -Response $client.Do($request) -Path (Get-ExampleOutput 'out21.xlsx') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
