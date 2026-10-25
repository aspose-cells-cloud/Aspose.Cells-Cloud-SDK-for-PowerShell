# LineFormat — Represents all setting of the line.
class LineFormat : FillFormat {
    # Gets and sets the begin arrow length type of the line.
    [string]$BeginArrowheadLength
    # Gets and sets the begin arrow type of the line.
    [string]$BeginArrowheadStyle
    # Gets and sets the begin arrow width type of the line.
    [string]$BeginArrowheadWidth
    # Specifies the ending caps.
    [string]$CapType
    # Specifies the line compound type.
    [string]$CompoundType
    # Specifies the line dash type.
    [string]$DashStyle
    # Gets and sets the end arrow length type of the line.
    [string]$EndArrowheadLength
    # Gets and sets the end arrow type of the line.
    [string]$EndArrowheadStyle
    # Gets and sets the end arrow width type of the line.
    [string]$EndArrowheadWidth
    # Specifies the line join type.
    [string]$JoinType
    # Gets or sets the weight of the line in unit of points.
    [Nullable[double]]$Weight
}
