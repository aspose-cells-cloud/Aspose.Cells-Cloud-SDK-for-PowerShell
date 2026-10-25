# Shape — Represents the msodrawing object.
class Shape : LinkElement {
    # Gets and sets the name of the shape.
    [string]$Name
    # Gets mso drawing type.
    [string]$MsoDrawingType
    # Gets and sets the auto shape type.
    [string]$AutoShapeType
    # Represents the way the drawing object is attached to the cells below it. The property controls the placement of an object on a worksheet.
    [string]$Placement
    # Represents upper left corner row index.
    [Nullable[int32]]$UpperLeftRow
    # Represents the vertical offset of shape from its top row, in unit of pixels.
    [Nullable[int32]]$Top
    # Represents upper left corner column index.
    [Nullable[int32]]$UpperLeftColumn
    # Represents the horizontal offset of shape from its left column, in unit of pixels.
    [Nullable[int32]]$Left
    # Represents lower right corner row index.
    [Nullable[int32]]$LowerRightRow
    # Represents the width of the shape's vertical offset from its lower bottom corner row, in unit of pixels.
    [Nullable[int32]]$Bottom
    # Represents lower right corner column index.
    [Nullable[int32]]$LowerRightColumn
    # Represents the width of the shape's horizontal offset from its lower right corner column, in unit of pixels.
    [Nullable[int32]]$Right
    # Represents the width of shape, in unit of pixels.
    [Nullable[int32]]$Width
    # Represents the height of shape, in unit of pixel.
    [Nullable[int32]]$Height
    # Gets and sets the horizontal offset of shape from worksheet left border,in unit of pixels.
    [Nullable[int32]]$X
    # Gets and sets the vertical offset of shape from worksheet top border,in unit of pixels.
    [Nullable[int32]]$Y
    # Gets and sets the rotation of the shape.
    [Nullable[double]]$RotationAngle
    # Gets and sets the html string which contains data and some formats in this textbox.
    [string]$HtmlText
    # Represents the string in this TextBox object.
    [string]$Text
    # Returns or sets the descriptive (alternative) text string of the object.
    [string]$AlternativeText
    # Gets and sets the text horizontal alignment type of the shape.
    [string]$TextHorizontalAlignment
    # Gets and sets the text horizontal overflow type of the shape which contains text.
    [string]$TextHorizontalOverflow
    # Gets and sets the text orientation type of the shape.
    [string]$TextOrientationType
    # Gets and sets the text vertical alignment type of the shape.
    [string]$TextVerticalAlignment
    # Gets and sets the text vertical overflow type of the shape which contains text.
    [string]$TextVerticalOverflow
    # Indicates whether the shape is a group.
    [Nullable[bool]]$IsGroup
    # Indicates whether the object is visible.
    [Nullable[bool]]$IsHidden
    # True means that don't allow changes in aspect ratio.
    [Nullable[bool]]$IsLockAspectRatio
    # True if the object is locked, False if the object can be modified when the sheet is protected.
    [Nullable[bool]]$IsLocked
    # True if the object is printable
    [Nullable[bool]]$IsPrintable
    # Gets and sets the text wrapped type of the shape which contains text.
    [Nullable[bool]]$IsTextWrapped
    # Indicates whether this shape is a word art.
    [Nullable[bool]]$IsWordArt
    # Gets or sets the worksheet range linked to the control's value.
    [string]$LinkedCell
    # Returns the position of a shape in the z-order.
    [Nullable[int32]]$ZOrderPosition
    # Represents the font of shape.
    [Font]$Font
    # Gets the hyperlink of the shape.
    [string]$Hyperlink
}
