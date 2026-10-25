# FilterColumn — Represents a filter for a single column. The Filter object is a member of the Filters collection
class FilterColumn {
    # Gets and sets the column offset in the range.
    [Nullable[int32]]$FieldIndex
    # Gets and sets the type fo filtering data.
    [string]$FilterType
    # This class contains a property named "MultipleFilters" of type "MultipleFilters" that can be both read and written.
    [MultipleFilters]$MultipleFilters
    [ColorFilter]$ColorFilter
    [CustomFilter[]]$CustomFilters
    [DynamicFilter]$DynamicFilter
    [IconFilter]$IconFilter
    [Top10Filter]$Top10Filter
    # Indicates whether the AutoFilter button for this column is visible.
    [string]$Visibledropdown
}
