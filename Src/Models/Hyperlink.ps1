# Hyperlink — Encapsulates the object that represents a hyperlink.
class Hyperlink : LinkElement {
    # Represents the address of a hyperlink.
    [string]$Address
    # Gets the range of hyperlink.
    [CellArea]$Area
    # Returns or sets the ScreenTip text for the specified hyperlink.
    [string]$ScreenTip
    # Represents the text to be displayed for the specified hyperlink. The default value is the address of the hyperlink.
    [string]$TextToDisplay
    # Gets the link type.
    [string]$LinkType
}
