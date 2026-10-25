# DataDeduplicationRequest
class DataDeduplicationRequest {
    # Spreadsheet files that require data fulling.
    [FileInfo]$File
    # This class has a property named "DeduplicationRegion" of type "DeduplicationRegion" with a default value of a new instance of the "DeduplicationRegion" class.
    [DeduplicationRegion]$DeduplicationRegion
    # finish to data cleansing, outfile`s file format.
    [string]$OutFileFormat
    # Whether check restriction of Spreadsheet file when user modify cells related objects.
    [Nullable[bool]]$CheckExcelRestriction
    # The regional settings for workbook.
    [string]$Region
}
