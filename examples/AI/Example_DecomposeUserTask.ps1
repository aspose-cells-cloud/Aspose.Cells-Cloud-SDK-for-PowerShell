#requires -Version 7.0
<#
.SYNOPSIS
    Turn a natural-language task description into a structured workbook (AI).

.DESCRIPTION
    Mirrors Python's AI/Example_DecomposeUserTask.py:

        decompose_user_task(DecomposeUserTaskRequest('...'), local_outpath='DecomposeUserTask.xlsx')

    The API returns a generated .xlsx; Save-Response writes the binary body to examples/output/.

.EXAMPLE
    pwsh -File ./examples/AI/Example_DecomposeUserTask.ps1
#>
using module ../../AsposeCellsCloud.psd1

. (Join-Path $PSScriptRoot '../common.ps1')

$client = New-CellsClient

Write-Step 'Decomposing a web-API task into a workbook'
$request  = [DecomposeUserTaskRequest]::new(
    'Develop a web API for a task-splitting feature on the existing system.')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'DecomposeUserTask.xlsx') | Out-Null

Write-Step 'Decomposing a study plan into a workbook'
$request  = [DecomposeUserTaskRequest]::new(
    'A 21-day basic Chinese review plan, focusing on writing key characters, memorizing classical poems, and practicing synonyms and antonyms.')
$response = $client.Do($request)
Save-Response -Response $response -Path (Get-ExampleOutput 'DecomposeUserTask_StudyPlan.xlsx') | Out-Null

Write-Host ''
Write-Host 'Done.' -ForegroundColor Green
