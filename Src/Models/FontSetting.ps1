# FontSetting — Represents a range of characters within the cell text.
class FontSetting {
    # Returns the font of this object.
    [Font]$Font
    # Gets the length of the characters.
    [Nullable[int32]]$Length
    # Gets the start index of the characters.
    [Nullable[int32]]$StartIndex
    # Returns the text options.
    [TextOptions]$TextOptions
    # Gets the type of text node.
    [string]$Type
}
