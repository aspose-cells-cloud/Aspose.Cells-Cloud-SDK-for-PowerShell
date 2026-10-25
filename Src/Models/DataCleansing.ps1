# DataCleansing — Represents data cleansing.
class DataCleansing {
    # A property named "Ranges" of type IList Range with a default value of an empty List of Range objects.
    [Range[]]$Ranges
    # Represents whether the data needs to be populated.
    [Nullable[bool]]$NeedFillData
    # Represents data fill.
    [DataFill]$DataFill
}
