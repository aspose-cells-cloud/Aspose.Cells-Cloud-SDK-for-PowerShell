# Style — Represents display style of excel document,such as font,color,alignment,border,etc. The Style object contains all style attributes (font, number format, alignment, and so on) as properties.
class Style {
    # Gets a object.
    [Font]$Font
    # Gets or sets the name of the style.
    [string]$Name
    # Gets and sets the culture-dependent pattern string for number format. If no number format has been set for this object, null will be returned. If number format is builtin, the pattern string corresponding to the builtin number will be returned.
    [string]$CultureCustom
    # Represents the custom number format string of this style object. If the custom number format is not set(For example, the number format is builtin), "" will be returned.
    [string]$Custom
    # Gets or sets a style's background color.
    [Color]$BackgroundColor
    # Gets or sets a style's foreground color.
    [Color]$ForegroundColor
    # Represents if the formula will be hidden when the worksheet is protected.
    [Nullable[bool]]$IsFormulaHidden
    # Indicates whether the number format is a date format.
    [Nullable[bool]]$IsDateTime
    # Gets or sets a value indicating whether the text within a cell is wrapped.
    [Nullable[bool]]$IsTextWrapped
    # Indicates whether the cell shading is a gradient pattern.
    [Nullable[bool]]$IsGradient
    # Gets or sets a value indicating whether a cell can be modified or not.
    [Nullable[bool]]$IsLocked
    # Indicates whether the number format is a percent format.
    [Nullable[bool]]$IsPercent
    # Represents if text automatically shrinks to fit in the available column width.
    [Nullable[bool]]$ShrinkToFit
    # Represents the indent level for the cell or range. Can only be an integer from 0 to 250.
    [Nullable[int32]]$IndentLevel
    # Gets or sets the display format of numbers and dates. The formatting patterns are different for different regions.
    [Nullable[int32]]$Number
    # Represents text rotation angle.
    [Nullable[int32]]$RotationAngle
    # Gets or sets the cell background pattern type.
    [string]$Pattern
    # Represents text reading order.
    [string]$TextDirection
    # Gets or sets the vertical alignment type of the text in a cell.
    [string]$VerticalAlignment
    # Gets or sets the horizontal alignment type of the text in a cell.
    [string]$HorizontalAlignment
    # A public property named `BorderCollection` that is a list of `Border` objects.
    [Border[]]$BorderCollection
    # Gets and sets the background theme color.
    [ThemeColor]$BackgroundThemeColor
    # Gets and sets the foreground theme color.
    [ThemeColor]$ForegroundThemeColor
}
