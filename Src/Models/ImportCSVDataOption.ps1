# ImportCSVDataOption — I'm happy to help! Could you please provide me with the features you would like me to summarize into a class summary?
class ImportCSVDataOption : ImportOption {
    # A property named SeparatorString of type string that can be accessed and modified publicly.
    [string]$SeparatorString
    [Nullable[bool]]$ConvertNumericData
    [Nullable[int32]]$FirstRow
    [Nullable[int32]]$FirstColumn
    [string]$SourceFile
    [CustomParserConfig[]]$CustomParsers
}
