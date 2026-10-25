# AutoFilter — Represents autofiltering for the specified worksheet.
class AutoFilter : LinkElement {
    # Gets the collection of the filter columns.
    [FilterColumn[]]$FilterColumns
    # Represents the range to which the specified AutoFilter applies.
    [string]$Range
    # Gets the data sorter.
    [DataSorter]$Sorter
    # Indicates whether the AutoFilter button for this column is visible.
    [Nullable[bool]]$ShowFilterButton
}
