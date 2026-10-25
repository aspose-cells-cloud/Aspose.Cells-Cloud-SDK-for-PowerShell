# SortKey — Represents sort key.
class SortKey {
    # Represents the key of sorting.
    [Nullable[int32]]$Key
    # Represents the order of sorting.
    [string]$SortOrder
    # This class includes a property named CustomList that is an array of strings with both getter and setter methods.
    [string[]]$CustomList
    # Indicates the order of sorting.
    [string]$Order
    # Gets the sorted column index(absolute position, column A is 0, B is 1, ...).
    [Nullable[int32]]$Index
    # Represents the type of sorting.
    [string]$Type
}
