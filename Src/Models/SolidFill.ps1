# SolidFill — Encapsulates the object that represents solid fill format
class SolidFill {
    # Gets or sets the .
    [Color]$Color
    # Gets and sets the object.
    [CellsColor]$CellsColor
    # Returns or sets the degree of transparency of the area as a value from 0.0 (opaque) through 1.0 (clear).
    [Nullable[double]]$Transparency
}
