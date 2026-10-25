# Border — Encapsulates the object that represents the cell border.
class Border {
    # Gets or sets the cell border type.
    [string]$LineStyle
    # Gets or sets the of the border.
    [Color]$Color
    # This class has a property called "BorderType" of type string that can be both get and set.
    [string]$BorderType
    # Gets and sets the theme color of the border.
    [ThemeColor]$ThemeColor
    # Gets and sets the color with a 32-bit ARGB value.
    [Nullable[int32]]$ArgbColor
}
