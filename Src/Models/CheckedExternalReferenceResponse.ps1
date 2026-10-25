# CheckedExternalReferenceResponse
class CheckedExternalReferenceResponse : CellsCloudResponse {
    [Nullable[bool]]$ReferenceOtherWorkbook
    [Nullable[bool]]$ReferenceOtherWorksheet
    [string[]]$Formulas
}
