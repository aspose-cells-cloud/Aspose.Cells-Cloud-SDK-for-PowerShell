# DataSorterKey — Represents the key of the data sorter.
class DataSorterKey {
    # Indicates the order of sorting.
    [string]$Order
    # Gets the sorted column index(absolute position, column A is 0, B is 1, ...).
    [Nullable[int32]]$Index
    # Represents the type of sorting.
    [string]$Type
    # Represents the icon set type.
    [string]$IconSetType
    # Represents the id of the icon set type.
    [Nullable[int32]]$IconId
    # Gets the sorted color.
    [Color]$Color
}
