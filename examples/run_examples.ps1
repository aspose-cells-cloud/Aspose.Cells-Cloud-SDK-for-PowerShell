#requires -Version 7.0
<#
.SYNOPSIS
    Run every Aspose.Cells Cloud PowerShell example, or a filtered subset.

.DESCRIPTION
    Each example runs in its own `pwsh` process. That is deliberate: the SDK's classes are
    loaded with `using module`, which must be the first statement of a script, and PowerShell
    classes cannot be redefined inside one session.

.PARAMETER Category
    Only run examples in this sub-folder (AI, Conversion, DataProcessing, Editor, Management,
    TextProcessing, Transform). Use 'root' for the three top-level samples.

.PARAMETER Name
    Wildcard filter on the script file name, e.g. -Name '*Convert*'.

.PARAMETER List
    Show the matching examples without running them.

.PARAMETER ContinueOnError
    Keep going after a failing example (default: stop at the first failure).

.EXAMPLE
    pwsh -File ./examples/run_examples.ps1 -List

.EXAMPLE
    pwsh -File ./examples/run_examples.ps1 -Category Conversion

.EXAMPLE
    pwsh -File ./examples/run_examples.ps1 -Name '*QuickStart*'
#>
[CmdletBinding()]
param(
    [string]$Category,
    [string]$Name = '*',
    [switch]$List,
    [switch]$ContinueOnError
)

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot

$examples = Get-ChildItem -Path $root -Filter 'Example_*.ps1' -Recurse -File |
    Sort-Object DirectoryName, Name |
    ForEach-Object {
        $itemRelative = $_.FullName.Substring($root.Length).TrimStart('\', '/')
        # NOTE: do not use $category/$name here — PowerShell variables are case-insensitive,
        # so they would overwrite the -Category / -Name parameters.
        $itemCategory = Split-Path -Path $itemRelative -Parent
        if ([string]::IsNullOrEmpty($itemCategory)) { $itemCategory = 'root' }
        [pscustomobject]@{
            Category = $itemCategory
            Name     = $_.Name
            Path     = $_.FullName
            Relative = $itemRelative
        }
    }

if ($Category) {
    $examples = @($examples | Where-Object { $_.Category -eq $Category })
}
if ($Name -and $Name -ne '*') {
    $examples = @($examples | Where-Object { $_.Name -like $Name })
}

if ($null -eq $examples -or @($examples).Count -eq 0) {
    Write-Warning 'No examples matched the filter.'
    exit 0
}
$examples = @($examples)

if ($List) {
    $examples | Format-Table Category, Name, Relative -AutoSize
    exit 0
}

$pwshPath = (Get-Process -Id $PID).Path
if ([string]::IsNullOrEmpty($pwshPath)) { $pwshPath = 'pwsh' }

Write-Host "Running $($examples.Count) example(s) with $pwshPath" -ForegroundColor Cyan

$failed  = @()
$passed  = 0

foreach ($example in $examples) {
    Write-Host ''
    Write-Host ('=' * 78) -ForegroundColor DarkGray
    Write-Host "RUN  $($example.Relative)" -ForegroundColor Cyan
    Write-Host ('=' * 78) -ForegroundColor DarkGray

    $start = [System.Diagnostics.Stopwatch]::StartNew()
    & $pwshPath -NoProfile -File $example.Path
    $exitCode = $LASTEXITCODE
    $start.Stop()

    if ($exitCode -eq 0) {
        $passed++
        Write-Host ("PASS {0} ({1:N1}s)" -f $example.Relative, $start.Elapsed.TotalSeconds) -ForegroundColor Green
    }
    else {
        $failed += $example.Relative
        Write-Host ("FAIL {0} (exit {1}, {2:N1}s)" -f $example.Relative, $exitCode, $start.Elapsed.TotalSeconds) -ForegroundColor Red
        if (-not $ContinueOnError) { break }
    }
}

Write-Host ''
Write-Host ('=' * 78) -ForegroundColor DarkGray
Write-Host "Summary: $passed passed, $($failed.Count) failed" -ForegroundColor $(if ($failed.Count -eq 0) { 'Green' } else { 'Red' })
if ($failed.Count -gt 0) {
    $failed | ForEach-Object { Write-Host "  failed: $_" -ForegroundColor Red }
    exit 1
}
exit 0
