# RangeSetStyleRequest — Indicates range set style request.
class RangeSetStyleRequest {
    # Encapsulates the object that represents a range of cells within a spreadsheet.
    [Range]$Range
    # Represents display style of excel document,such as font,color,alignment,border,etc.
    [Style]$Style
}
