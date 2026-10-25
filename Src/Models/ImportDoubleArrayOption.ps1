# ImportDoubleArrayOption — Class summary: The features include grammar and spell check, word count, readability analysis, and style suggestions for improving writing.
class ImportDoubleArrayOption : ImportOption {
    # This class has a public property named FirstRow of type integer with both get and set accessors.
    [Nullable[int32]]$FirstRow
    [Nullable[int32]]$FirstColumn
    [Nullable[bool]]$IsVertical
    [double[]]$Data
}
