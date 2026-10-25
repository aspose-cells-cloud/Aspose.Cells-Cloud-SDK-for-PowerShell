# ErrorBar — Represents error bar of data series.
class ErrorBar : Line {
    # A property named "Link" of type "Link" that can be accessed and modified.
    [Link]$Link
    # Represents amount of error bar. The amount must be greater than or equal to zero.
    [Nullable[double]]$Amount
    # Represents error bar display type.
    [string]$DisplayType
    # Represents negative error amount when error bar type is Custom.
    [string]$MinusValue
    # Represents positive error amount when error bar type is Custom.
    [string]$PlusValue
    # Indicates if formatting error bars with a T-top.
    [Nullable[bool]]$ShowMarkerTTop
    # Represents error bar amount type.
    [string]$Type
}
