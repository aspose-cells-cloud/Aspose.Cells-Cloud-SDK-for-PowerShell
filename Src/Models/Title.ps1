# Title — Encapsulates the object that represents the title of chart or axis.
class Title : ChartFrame {
    # Represents whether the title is visible.
    [Nullable[bool]]$IsVisible
    # A property named LinkedSource with both set and get accessors is defined.
    [string]$LinkedSource
    [Nullable[int32]]$RotationAngle
    # Gets or sets the text of display unit label.
    [string]$Text
    [string]$TextDirection
    [string]$TextHorizontalAlignment
    [string]$TextVerticalAlignment
}
