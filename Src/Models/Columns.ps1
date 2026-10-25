# Columns — Columns
class Columns : LinkElement {
    # The max column index.
    [Nullable[int32]]$MaxColumn
    # Column count.
    [Nullable[int32]]$ColumnsCount
    # Columns list.
    [LinkElement[]]$ColumnsList
}
