# AnalyzedColumnDescription — Represents description of analyzed column.
class AnalyzedColumnDescription {
    # Column index.
    [Nullable[int32]]$Index
    # The true position index value of the column.
    [Nullable[int32]]$ColumnIndex
    # This class has a public property "Title" of type string with a default value of an empty string.
    [string]$Title
    # When the repetition rate is high, can it be viewed as a group display?
    [Nullable[double]]$RepetitionRate
    # The column type is identified, and the attributes of the column are determined after data analysis.
    [string]$ColumnDataDataType
    [string]$NumberCategoryType
    [string]$TextCategoryType
    [Nullable[int32]]$StyleNumber
    # Column data exception description.
    [string]$ColumnDataExceptionDescription
}
