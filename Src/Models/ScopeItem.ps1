# ScopeItem — Define the specific range in your Excel worksheet where you want the spreadsheet operations to be performed. This ensures that only the cells within the selected range are processed, and any operations are confined to this area.
class ScopeItem {
    # The specific worksheet of spreadsheet.
    [string]$Worksheet
    # The specific ranges of worksheet.
    [string[]]$Ranges
}
