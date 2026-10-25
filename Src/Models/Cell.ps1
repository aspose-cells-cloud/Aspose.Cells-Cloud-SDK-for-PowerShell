# Cell — Encapsulates the object that represents a single Workbook cell.
class Cell : LinkElement {
    # Gets the name of the cell.
    [string]$Name
    # Gets row number (zero based) of the cell.
    [Nullable[int32]]$Row
    # Gets column number (zero based) of the cell.
    [Nullable[int32]]$Column
    # Gets the value contained in this cell.
    [string]$Value
    # Represents cell value type.
    [string]$Type
    # Gets or sets a formula of the .
    [string]$Formula
    # Represents if the specified cell contains formula.
    [Nullable[bool]]$IsFormula
    # Checks if a cell is part of a merged range or not.
    [Nullable[bool]]$IsMerged
    # Indicates the cell's formula is and array formula and it is the first cell of the array.
    [Nullable[bool]]$IsArrayHeader
    # Indicates whether the cell formula is an array formula.
    [Nullable[bool]]$IsInArray
    # Checks if the value of this cell is an error.
    [Nullable[bool]]$IsErrorValue
    # Indicates whether this cell is part of table formula.
    [Nullable[bool]]$IsInTable
    # Indicates if the cell's style is set. If return false, it means this cell has a default cell format.
    [Nullable[bool]]$IsStyleSet
    # Gets and sets the html string which contains data and some formats in this cell.
    [string]$HtmlString
    # This class property represents a style element with the specified XML element name.
    [LinkElement]$Style
    # Gets the parent worksheet.
    [string]$Worksheet
}
