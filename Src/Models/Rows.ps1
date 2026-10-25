# Rows — Collects the objects that represent the individual rows in a worksheet.
class Rows : LinkElement {
    # This property allows access to set and retrieve the maximum row value in the class.
    [Nullable[int32]]$MaxRow
    [Nullable[int32]]$RowsCount
    [LinkElement[]]$RowsList
}
