# Font — Encapsulates the font object used in a spreadsheet.
class Font {
    # Gets or sets the of the font.
    [Color]$Color
    # Gets and sets the double size of the font.
    [Nullable[double]]$DoubleSize
    # Gets or sets a value indicating whether the font is bold.
    [Nullable[bool]]$IsBold
    # Gets or sets a value indicating whether the font is italic.
    [Nullable[bool]]$IsItalic
    # Gets or sets a value indicating whether the font is single strikeout.
    [Nullable[bool]]$IsStrikeout
    # Gets or sets a value indicating whether the font is subscript.
    [Nullable[bool]]$IsSubscript
    # Gets or sets a value indicating whether the font is super script.
    [Nullable[bool]]$IsSuperscript
    # Gets or sets the name of the .
    [string]$Name
    # Gets or sets the size of the font.
    [Nullable[int32]]$Size
    # Gets or sets the font underline type.
    [string]$Underline
}
