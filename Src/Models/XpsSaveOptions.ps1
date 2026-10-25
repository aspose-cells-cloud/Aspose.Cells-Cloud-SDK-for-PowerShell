# XpsSaveOptions
class XpsSaveOptions : PaginatedSaveOptions {
    [string]$SaveFormat
    [string]$CachedFileFolder
    [Nullable[bool]]$ClearData
    [Nullable[bool]]$CreateDirectory
    [Nullable[bool]]$EnableHTTPCompression
    [Nullable[bool]]$RefreshChartCache
    [Nullable[bool]]$SortNames
    [Nullable[bool]]$ValidateMergedAreas
    [Nullable[bool]]$CheckExcelRestriction
    [Nullable[bool]]$EncryptDocumentProperties
}
