# BatchConvertRequest — Indicates batch convert file request
class BatchConvertRequest {
    # The directory stores files that need to format conversion.
    [string]$SourceFolder
    # Aspose Cloud storage name.
    [string]$SourceStorage
    # Indicates the match condition that needs to be processed for the file name.
    [MatchConditionRequest]$MatchCondition
    # Conversion format.
    [string]$Format
    # The directory that stores files whose format conversion was successful.
    [string]$OutFolder
    # Aspose Cloud storage name.
    [string]$OutStorage
    # The regional settings for workbook.
    [string]$Region
    # A nullable Boolean property that determines whether the content should be fit to the entire page width on each sheet.
    [Nullable[bool]]$PageWideFitOnPerSheet
    [Nullable[bool]]$PageTallFitOnPerSheet
    # Indicates save options.
    [SaveOptions]$SaveOptions
}
