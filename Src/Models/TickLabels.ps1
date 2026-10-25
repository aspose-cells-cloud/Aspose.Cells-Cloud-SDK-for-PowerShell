# TickLabels — Represents the tick-mark labels associated with tick marks on a chart axis.
class TickLabels : LinkElement {
    # True if the text in the object changes font size when the object size changes. The default value is True.
    [Nullable[bool]]$AutoScaleFont
    # Gets and sets the display mode of the background
    [string]$BackgroundMode
    # Returns a object that represents the font of the specified TickLabels object.
    [Font]$Font
    # Represents the format number for the TickLabels object.
    [Nullable[int32]]$Number
    # Represents the format string for the TickLabels object.
    [string]$NumberFormat
    # True if the number format is linked to the cells (so that the number format changes in the labels when it changes in the cells).
    [Nullable[bool]]$NumberFormatLinked
    # Gets and sets the distance of labels from the axis.
    [Nullable[int32]]$Offset
    # Represents text rotation angle in clockwise.
    [Nullable[int32]]$RotationAngle
    # Represents text reading order.
    [string]$TextDirection
    # Represents text reading order.
    [string]$ReadingOrder
    # Gets and sets the direction of text.
    [string]$DirectionType
}
