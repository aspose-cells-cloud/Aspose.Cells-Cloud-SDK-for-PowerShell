# MultipleFilters — Represents the multiple filter collection.
class MultipleFilters {
    # A nullable boolean property that determines if a blank space should be matched.
    [Nullable[bool]]$MatchBlank
    [object[]]$MultipleFilterList
}
