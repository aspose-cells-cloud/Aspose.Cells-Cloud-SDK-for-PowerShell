# PivotFilter — Represents a PivotFilter in PivotFilter Collection.
class PivotFilter {
    # Gets the autofilter of the pivot filter.
    [AutoFilter]$AutoFilter
    # Gets the Evaluation Order of the pivot filter.
    [Nullable[int32]]$EvaluationOrder
    # Gets the field index of the pivot filter.
    [Nullable[int32]]$FieldIndex
    # Gets the autofilter type of the pivot filter.
    [string]$FilterType
    # Gets the measure field index of the pivot filter.
    [Nullable[int32]]$ValueFieldIndex
    # Gets the member property field index of the pivot filter.
    [Nullable[int32]]$MemberPropertyFieldIndex
    # Gets the name of the pivot filter.
    [string]$Name
    # Gets the string value1 of the label pivot filter.
    [string]$Value1
    # Gets the string value2 of the label pivot filter.
    [string]$Value2
    # A property that allows for setting and getting a Top10Filter object for filtering data.
    [Top10Filter]$Top10Filter
}
