# AnalyzedResult — Represents results of analyzed data.
class AnalyzedResult {
    # Represents the file name of data file.
    [string]$Filename
    # Represents summary about results of analyzed data.
    [string]$Description
    # Represents Excel data statistics.
    [ExcelDataStatistics]$BasicStatistics
    # Represents analyzed table description.
    [AnalyzedTableDescription[]]$Results
    # base64String Excel file
    [string]$SuggestedFile
}
