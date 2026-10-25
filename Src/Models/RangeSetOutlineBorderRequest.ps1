# RangeSetOutlineBorderRequest — Indicates range set outline border request.
class RangeSetOutlineBorderRequest {
    # Encapsulates the object that represents a range of cells within a spreadsheet.
    [Range]$Range
    # LeftBorder, RightBorder, TopBorder, BottomBorder, DiagonalDown, DiagonalUp, Vertical and Horizontal.
    [string]$BorderEdge
    # None, Thin, Medium, Dashed, Dotted, Thick, Double, Hair, MediumDashed, DashDot, MediumDashDot, DashDotDot, MediumDashDotDot and SlantedDashDot.
    [string]$BorderStyle
    # Border color.
    [Color]$BorderColor
}
