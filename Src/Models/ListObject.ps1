# ListObject — Represents a list object on a worksheet. The ListObject object is a member of the ListObjects collection. The ListObjects collection contains all the list objects on a worksheet.
class ListObject : LinkElement {
    # Gets auto filter.
    [AutoFilter]$AutoFilter
    # Gets and sets the display name.
    [string]$DisplayName
    # Gets the start column of the range.
    [Nullable[int32]]$StartColumn
    # Gets the start row of the range.
    [Nullable[int32]]$StartRow
    # Gets the end column of the range.
    [Nullable[int32]]$EndColumn
    # Gets the end row of the range.
    [Nullable[int32]]$EndRow
    # Gets ListColumns of the ListObject.
    [ListColumn[]]$ListColumns
    # Gets and sets whether this ListObject show header row.
    [Nullable[bool]]$ShowHeaderRow
    # Indicates whether column stripe formatting is applied.
    [Nullable[bool]]$ShowTableStyleColumnStripes
    # Indicates whether the first column in the table should have the style applied.
    [Nullable[bool]]$ShowTableStyleFirstColumn
    # Indicates whether the last column in the table should have the style applied.
    [Nullable[bool]]$ShowTableStyleLastColumn
    # Indicates whether row stripe formatting is applied.
    [Nullable[bool]]$ShowTableStyleRowStripes
    # Gets and sets whether this ListObject show total row.
    [Nullable[bool]]$ShowTotals
    # Gets and sets the table style name.
    [string]$TableStyleName
    # Gets and the built-in table style.
    [string]$TableStyleType
    # Gets the data range of the ListObject.
    [Range]$DataRange
    # Gets the data source type of the table.
    [string]$DataSourceType
    # Gets and sets the comment of the table.
    [string]$Comment
    # Gets an used for this list.
    [XmlMap]$XmlMap
    # Gets and sets the alternative text.
    [string]$AlternativeText
    # Gets and sets the alternative description.
    [string]$AlternativeDescription
}
