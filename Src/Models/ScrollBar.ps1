# ScrollBar — Represents a scroll bar object.
class ScrollBar : Shape {
    # Gets or sets the current value.
    [Nullable[int32]]$CurrentValue
    # Gets or sets the amount that the scroll bar or spinner is incremented a line scroll.
    [Nullable[int32]]$IncrementalChange
    # Indicates whether this is a horizontal scroll bar.
    [Nullable[bool]]$IsHorizontal
    # Gets or sets the maximum value of a scroll bar or spinner range.
    [Nullable[int32]]$Max
    # Gets or sets the minimum value of a scroll bar or spinner range.
    [Nullable[int32]]$Min
    # Gets or sets page change
    [Nullable[int32]]$PageChange
    # Indicates whether the shape has 3-D shading.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
