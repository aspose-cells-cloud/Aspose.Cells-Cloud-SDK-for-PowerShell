# TextureFill — Encapsulates the object that represents texture fill format
class TextureFill {
    # Gets and sets the texture type
    [string]$Type
    # Returns or sets the degree of transparency of the area as a value from 0.0 (opaque) through 1.0 (clear).
    [Nullable[double]]$Transparency
    # Gets and sets the picture format scale.
    [Nullable[double]]$Scale
    # Gets or sets tile picture option.
    [TilePicOption]$TilePicOption
    # Gets or sets picture format option.
    [PicFormatOption]$PicFormatOption
    # The class has a public property named "Image" of type LinkElement that can be accessed and set.
    [LinkElement]$Image
}
