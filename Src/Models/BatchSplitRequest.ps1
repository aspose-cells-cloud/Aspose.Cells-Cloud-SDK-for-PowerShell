# BatchSplitRequest — Class summary: Identifying key features of a statistical dataset and methods for data analysis.
class BatchSplitRequest {
    # The directory stores files that need to format conversion.
    [string]$SourceFolder
    # Aspose Cloud storage name
    [string]$SourceStorage
    # Indicates the match condition that needs to be processed for the file name.
    [MatchConditionRequest]$MatchCondition
    # Output file format
    [string]$Format
    # From worksheet index of workbook.
    [Nullable[int32]]$FromIndex
    # To worksheet index of workbook.
    [Nullable[int32]]$ToIndex
    # The directory that stores files whose format conversion was successful.
    [string]$OutFolder
    # Aspose Cloud storage name.
    [string]$OutStorage
    # The regional settings for workbook.
    [string]$Region
    # Indicates save options.
    [SaveOptions]$SaveOptions
}
