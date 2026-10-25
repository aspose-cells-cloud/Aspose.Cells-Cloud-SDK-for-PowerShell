# GradientFill — Represents the gradient fill.
class GradientFill {
    # Gets the gradient fill type.
    [string]$FillType
    # Gets the gradient direction type.
    [string]$DirectionType
    # The angle of linear fill.
    [Nullable[double]]$Angle
    # Represents the gradient stop collection.
    [GradientFillStop[]]$GradientStops
}
