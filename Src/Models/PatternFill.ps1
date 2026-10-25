# PatternFill — Encapsulates the object that represents pattern fill format
class PatternFill {
    # Gets or sets the fill pattern type
    [string]$Pattern
    # Gets and sets the foreground object.
    [CellsColor]$BackgroundCellsColor
    # Gets and sets the foreground object.
    [CellsColor]$ForegroundCellsColor
    # Gets or sets the foreground .
    [Color]$ForegroundColor
    # Gets or sets the background of the .
    [Color]$BackgroundColor
    # Gets or sets the transparency of background color.
    [Nullable[double]]$BackTransparency
    # Gets or sets the transparency of foreground color.
    [Nullable[double]]$ForeTransparency
}
