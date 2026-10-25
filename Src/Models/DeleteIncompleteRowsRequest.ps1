# DeleteIncompleteRowsRequest — I'm here to help! Could you please provide the features you would like me to summarize?
class DeleteIncompleteRowsRequest {
    # Spreadsheet files that require data fulling.
    [FileInfo]$File
    # finish to data cleansing, outfile`s file format.
    [string]$OutFileFormat
    # Whether check restriction of Spreadsheet file when user modify cells related objects.
    [Nullable[bool]]$CheckExcelRestriction
    # The regional settings for workbook.
    [string]$Region
    # A property named "Ranges" of type IList of Range, with a default value of an empty List of Range.
    [Range[]]$Ranges
}
