# DataFillValue — Represents that the data is populated with the specified value.
class DataFillValue {
    # Represents default bool value.
    [Nullable[bool]]$DefaultBoolean
    # Represents default string value.
    [string]$DefaultString
    # Represents default number value.
    [Nullable[int32]]$DefaultNumber
    # Represents default double value.
    [Nullable[double]]$DefaultDouble
    # Represents default date value.
    [string]$DefaultDate
}
