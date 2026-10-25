# Column — Represents a single column in a worksheet.
class Column : LinkElement {
    # Gets the group level of the column.
    [Nullable[int32]]$GroupLevel
    # Gets the index of this column.
    [Nullable[int32]]$Index
    # Indicates whether the column is hidden.
    [Nullable[bool]]$IsHidden
    # Gets and sets the column width in unit of characters.
    [Nullable[double]]$Width
    # Gets the style of this column.
    [LinkElement]$Style
}
