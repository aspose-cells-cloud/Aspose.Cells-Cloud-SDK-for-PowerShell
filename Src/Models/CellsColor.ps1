# CellsColor — Represents all types of color.
class CellsColor {
    # Gets and sets the RGB color.
    [Color]$Color
    # Gets and sets the color index in the color palette. Only applies of indexed color.
    [Nullable[int32]]$ColorIndex
    # Gets and set the color which should apply to cell or shape.
    [Nullable[bool]]$IsShapeColor
    # Set the tint of the shape color
    [Nullable[double]]$Tint
    # Gets and sets the color from a 32-bit ARGB value.
    [Nullable[int32]]$Argb
    # Gets the theme color. Only applies for theme color type.
    [ThemeColor]$ThemeColor
    # The color type.
    [string]$Type
    # Gets and sets transparency as a value from 0.0 (opaque) through 1.0 (clear).
    [Nullable[double]]$Transparency
}
