# Sparkline — A sparkline represents a tiny chart or graphic in a worksheet cell that provides a visual representation of data.
class Sparkline {
    # Gets the column index of the sparkline.
    [Nullable[int32]]$Column
    # Represents the data range of the sparkline.
    [string]$DataRange
    # Gets the row index of the sparkline.
    [Nullable[int32]]$Row
}
