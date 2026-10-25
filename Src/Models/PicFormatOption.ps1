# PicFormatOption — Represents picture format option
class PicFormatOption {
    # Gets or sets the picture fill type.
    [string]$Type
    # Gets or sets how many the picture stack and scale with.
    [Nullable[double]]$Scale
    # Gets or sets the left offset for stretching picture.
    [Nullable[double]]$Left
    # Gets or sets the right offset for stretching picture.
    [Nullable[double]]$Right
    # Gets or sets the top offset for stretching picture.
    [Nullable[double]]$Top
    # Gets or sets the bottom offset for stretching picture.
    [Nullable[double]]$Bottom
}
