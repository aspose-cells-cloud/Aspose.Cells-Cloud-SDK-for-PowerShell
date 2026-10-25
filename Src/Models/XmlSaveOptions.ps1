# XmlSaveOptions
class XmlSaveOptions : SaveOptions {
    [int32[]]$SheetIndexes
    [CellArea]$ExportArea
    [Nullable[bool]]$HasHeaderRow
    [string]$XmlMapName
    [Nullable[bool]]$SheetNameAsElementName
    [Nullable[bool]]$DataAsAttribute
}
