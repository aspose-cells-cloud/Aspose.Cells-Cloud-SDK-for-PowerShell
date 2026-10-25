# DataCleansingRequest — A data cleansing request for an Spreadsheet file.
class DataCleansingRequest {
    # Spreadsheet files that require data cleaning.
    [FileInfo]$File
    # Whether check restriction of Spreadsheet file when user modify cells related objects.
    [Nullable[bool]]$CheckExcelRestriction
    # The regional settings for workbook.
    [string]$Region
    # finish to data cleansing, outfile`s file format.
    [string]$OutFileFormat
    # Data cleansing content
    [DataCleansing]$DataCleansing
}
