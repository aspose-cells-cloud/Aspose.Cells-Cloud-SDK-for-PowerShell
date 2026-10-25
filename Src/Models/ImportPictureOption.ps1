# ImportPictureOption — Class summary: The features of the topic were explored, discussing its components, patterns, and significance.
class ImportPictureOption : ImportOption {
    # A property "UpperLeftRow" of type integer with a public getter and setter is defined.
    [Nullable[int32]]$UpperLeftRow
    [Nullable[int32]]$UpperLeftColumn
    [Nullable[int32]]$LowerRightRow
    [Nullable[int32]]$LowerRightColumn
    [string]$Filename
    # base64
    [string]$Data
}
