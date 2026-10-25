# CopyOptions — Represents the copy options.
class CopyOptions {
    # Indicates whether copying column width in unit of characters.
    [Nullable[bool]]$ColumnCharacterWidth
    # If the formula is not valid for the dest destination, only copy values.
    [Nullable[bool]]$CopyInvalidFormulasAsValues
    # Indicates whether copying the names.
    [Nullable[bool]]$CopyNames
    # Indicates whether extend ranges when copying the range to adjacent range.
    [Nullable[bool]]$ExtendToAdjacentRange
    # When copying the range in the same file and the chart refers to the source sheet, False means the copied chart's data source will not be changed. True means the copied chart's data source refers to the destination sheet.
    [Nullable[bool]]$ReferToDestinationSheet
    # In ms excel, when copying formulas which refer to other worksheets while copying a worksheet to another one, the copied formulas should refer to source workbook. However, for some situations user may need the copied formulas refer to worksheets with the same name in the same workbook, such as when those worksheets have been copied before this copy operation, then this property should be kept as true.
    [Nullable[bool]]$ReferToSheetWithSameName
    [Nullable[bool]]$CopyTheme
}
