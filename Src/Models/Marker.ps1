# Marker — Represents the marker in a line chart, scatter chart, or radar chart.
class Marker {
    # Gets the border.
    [Line]$Border
    # Gets the area.
    [Area]$Area
    # Represents the marker size in unit of points. Applies to line chart, scatter chart, or radar chart.
    [Nullable[int32]]$MarkerSize
    # Represents the marker style. Applies to line chart, scatter chart, or radar chart.
    [string]$MarkerStyle
}
