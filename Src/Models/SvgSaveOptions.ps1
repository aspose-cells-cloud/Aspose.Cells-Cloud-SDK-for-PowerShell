# SvgSaveOptions
class SvgSaveOptions : SaveOptions {
    [Nullable[int32]]$SheetIndex
    [string]$ChartImageType
    [string]$EmbededImageNameInSvg
    [Nullable[int32]]$HorizontalResolution
    [string]$ImageFormat
    [Nullable[bool]]$IsCellAutoFit
    [Nullable[bool]]$OnePagePerSheet
    [Nullable[bool]]$OnlyArea
    [string]$PrintingPage
    [Nullable[bool]]$PrintWithStatusDialog
    [Nullable[int32]]$Quality
    [string]$TiffCompression
    [Nullable[int32]]$VerticalResolution
}
