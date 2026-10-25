# TextOptions — Represents the text options.
class TextOptions : Font {
    # Represents fill format.
    [FillFormat]$Fill
    # Represents kerning.
    [Nullable[double]]$Kerning
    # Represents outline format.
    [LineFormat]$Outline
    # Represents shadow effect.
    [ShadowEffect]$Shadow
    # Represents spacing.
    [Nullable[double]]$Spacing
    # Represents under line color.
    [CellsColor]$UnderlineColor
}
