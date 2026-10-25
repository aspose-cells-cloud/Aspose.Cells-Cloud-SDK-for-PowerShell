# PaginatedSaveOptions
class PaginatedSaveOptions : SaveOptions {
    [string]$DefaultFont
    [Nullable[bool]]$CheckWorkbookDefaultFont
    [Nullable[bool]]$CheckFontCompatibility
    [Nullable[bool]]$IsFontSubstitutionCharGranularity
    [Nullable[bool]]$OnePagePerSheet
    [Nullable[bool]]$AllColumnsInOnePagePerSheet
    [Nullable[bool]]$IgnoreError
    [Nullable[bool]]$OutputBlankPageWhenNothingToPrint
    [Nullable[int32]]$PageIndex
    [Nullable[int32]]$PageCount
    [string]$PrintingPageType
    [string]$GridlineType
    [string]$TextCrossType
    [string]$DefaultEditLanguage
    [string]$EmfRenderSetting
    [Nullable[bool]]$MergeAreas
    [Nullable[bool]]$SortExternalNames
    [Nullable[bool]]$UpdateSmartArt
}
