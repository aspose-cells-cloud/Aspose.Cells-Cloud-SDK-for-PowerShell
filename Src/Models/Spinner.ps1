# Spinner — Represents the Forms control: Spinner.
class Spinner : Shape {
    # Gets or sets the current value.
    [Nullable[int32]]$CurrentValue
    # Gets or sets the amount that the scroll bar or spinner is incremented a line scroll.
    [Nullable[int32]]$IncrementalChange
    # Gets or sets the maximum value of a scroll bar or spinner range.
    [Nullable[int32]]$Max
    # Gets or sets the minimum value of a scroll bar or spinner range.
    [Nullable[int32]]$Min
    # Indicates whether the shape has 3-D shading.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
