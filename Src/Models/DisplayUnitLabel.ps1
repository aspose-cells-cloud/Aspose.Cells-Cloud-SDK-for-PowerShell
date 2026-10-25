# DisplayUnitLabel — Represents the display unit label.
class DisplayUnitLabel : ChartFrame {
    # A public property named "LinkedSource" with a string data type can be set and accessed.
    [string]$LinkedSource
    [Nullable[int32]]$RotationAngle
    # Gets or sets the text of display unit label.
    [string]$Text
    [string]$TextHorizontalAlignment
    [string]$TextVerticalAlignment
}
