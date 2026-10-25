# PivotItem — Represents a item in a PivotField report.
class PivotItem {
    # Gets the index of the pivot item in cache field.
    [Nullable[int32]]$Index
    # Represents whether the specified item visible.
    [Nullable[bool]]$IsHidden
    # Gets the name
    [string]$Name
    # Gets the value of the specified item.
    [string]$Value
}
