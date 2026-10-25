# Top10Filter — Represents the top 10 filter.
class Top10Filter {
    # An integer property named FieldIndex that can be accessed and modified.
    [Nullable[int32]]$FieldIndex
    [string]$Criteria
    # Indicates whether the items is percent.
    [Nullable[bool]]$IsPercent
    # Indicates whether it's top filter.
    [Nullable[bool]]$IsTop
    # Gets and sets the items of the filter.
    [Nullable[int32]]$Items
}
