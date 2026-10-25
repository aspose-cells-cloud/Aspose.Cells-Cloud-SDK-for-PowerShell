# Line — Encapsulates the object that represents the line format.
class Line {
    # Specifies the length of the arrowhead for the begin of a line.
    [string]$BeginArrowLength
    # Specifies the width of the arrowhead for the begin of a line.
    [string]$BeginArrowWidth
    # Specifies an arrowhead for the begin of a line.
    [string]$BeginType
    # Specifies the ending caps.
    [string]$CapType
    # Represents the of the line.
    [Color]$Color
    # Specifies the compound line type
    [string]$CompoundType
    # Specifies the dash line type
    [string]$DashType
    # Specifies the length of the arrowhead for the end of a line.
    [string]$EndArrowLength
    # Specifies the width of the arrowhead for the end of a line.
    [string]$EndArrowWidth
    # Specifies an arrowhead for the end of a line.
    [string]$EndType
    # Represents gradient fill.
    [GradientFill]$GradientFill
    # Indicates whether this line style is auto assigned.
    [Nullable[bool]]$IsAuto
    # Indicates whether the color of line is automatic assigned.
    [Nullable[bool]]$IsAutomaticColor
    # Represents whether the line is visible.
    [Nullable[bool]]$IsVisible
    # Specifies the joining caps.
    [string]$JoinType
    # Represents the style of the line.
    [string]$Style
    # Returns or sets the degree of transparency of the line as a value from 0.0 (opaque) through 1.0 (clear).
    [Nullable[double]]$Transparency
    # Gets or sets the of the line.
    [string]$Weight
    # Gets or sets the weight of the line in unit of points.
    [Nullable[double]]$WeightPt
}
