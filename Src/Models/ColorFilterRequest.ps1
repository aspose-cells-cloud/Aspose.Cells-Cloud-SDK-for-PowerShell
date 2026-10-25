# ColorFilterRequest — Indicates color filter request
class ColorFilterRequest {
    # Gets or sets the fill pattern type
    [string]$Pattern
    # Foreground color
    [CellsColor]$ForegroundColor
    # Background color
    [CellsColor]$BackgroundColor
}
