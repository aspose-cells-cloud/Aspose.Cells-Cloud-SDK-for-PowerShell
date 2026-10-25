# Name — Represents a defined name for a range of cells.
class Name : LinkElement {
    # Gets and sets the comment of the name. Only applies for Excel 2007.
    [string]$Comment
    # Property Summary: WorksheetIndex is an optional integer property marked with the XmlElement attribute "worksheetindex".
    [Nullable[int32]]$WorksheetIndex
    # Indicates whether this name is referred by other formulas.
    [Nullable[bool]]$IsReferred
    # Indicates whether the name is visible.
    [Nullable[bool]]$IsVisible
    # Gets or sets a R1C1 reference of the .
    [string]$R1C1RefersTo
    # Returns or sets the formula that the name is defined to refer to, beginning with an equal sign.
    [string]$RefersTo
    # Gets the name text of the object.
    [string]$Text
}
