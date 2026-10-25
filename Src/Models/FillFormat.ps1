# FillFormat — Encapsulates the object that represents fill formatting for a shape.
class FillFormat {
    # Gets and sets the fill type.
    [string]$Type
    # Gets object.
    [SolidFill]$SolidFill
    # Gets object.
    [PatternFill]$PatternFill
    # Gets object.
    [TextureFill]$TextureFill
    # Gets object.
    [GradientFill]$GradientFill
    # Gets and sets the picture image data.
    [string]$ImageData
}
