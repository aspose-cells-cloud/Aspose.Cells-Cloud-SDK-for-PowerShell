# Row — Represents a single row in a worksheet.
class Row : LinkElement {
    # Gets the group level of the row.
    [Nullable[int32]]$GroupLevel
    # Gets and sets the row height in unit of Points.
    [Nullable[double]]$Height
    # Gets the index of this row.
    [Nullable[int32]]$Index
    # Indicates whether the row contains any data
    [Nullable[bool]]$IsBlank
    # Indicates that row height and default font height matches.
    [Nullable[bool]]$IsHeightMatched
    # Indicates whether the row is hidden.
    [Nullable[bool]]$IsHidden
    # Represents the style of this row.
    [LinkElement]$Style
}
