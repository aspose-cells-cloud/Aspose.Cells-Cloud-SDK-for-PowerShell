# DiscoverChart — Represents a chart, which is a chart created based on data analysis of a table.
class DiscoverChart {
    # Represents chart name.
    [string]$Name
    # Represents worksheet name which is where the chart is located.
    [string]$SheetName
    # Represents chart title.
    [string]$Title
    # Represents chart type.
    [string]$Type
    # Represents chart data range.
    [string]$DataRange
    # Represents chart thumbnail. Base64String
    [string]$Thumbnail
}
