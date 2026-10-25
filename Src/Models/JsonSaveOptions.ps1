# JsonSaveOptions
class JsonSaveOptions : SaveOptions {
    [CellArea]$ExportArea
    [Nullable[bool]]$HasHeaderRow
    [Nullable[bool]]$ExportAsString
    [string]$Indent
}
