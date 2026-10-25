# DataFillRequest — I'm happy to help! Please provide the features you would like me to summarize.
class DataFillRequest {
    # Spreadsheet files that require data fulling.
    [FileInfo]$File
    # finish to data cleansing, outfile`s file format.
    [string]$OutFileFormat
    # Whether check restriction of Spreadsheet file when user modify cells related objects.
    [Nullable[bool]]$CheckExcelRestriction
    # The regional settings for workbook.
    [string]$Region
    # Fill data default value.
    [DataFill]$DataFill
}
