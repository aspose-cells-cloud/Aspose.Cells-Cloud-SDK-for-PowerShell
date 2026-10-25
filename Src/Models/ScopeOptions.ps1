# ScopeOptions — Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
class ScopeOptions {
    # ScopeOptionsType is a type that represents options or settings that are specific to a particular scope.
    [string]$Scope
    # Specifies the designated work area within the worksheet where operations are to be performed.
    [ScopeItem[]]$ScopeItems
}
