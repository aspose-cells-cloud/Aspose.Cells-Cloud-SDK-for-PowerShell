# PdfSaveOptions
class PdfSaveOptions : SaveOptions {
    [Nullable[bool]]$DisplayDocTitle
    [Nullable[bool]]$ExportDocumentStructure
    [string]$EmfRenderSetting
    [string]$CustomPropertiesExport
    [string]$OptimizationType
    [string]$Producer
    [string]$PdfCompression
    [string]$FontEncoding
    [RenderingWatermark]$Watermark
    [Nullable[bool]]$CalculateFormula
    [Nullable[bool]]$CheckFontCompatibility
    [string]$Compliance
    [string]$DefaultFont
    [Nullable[bool]]$OnePagePerSheet
    [string]$PrintingPageType
    [PdfSecurityOptions]$SecurityOptions
    [Nullable[int32]]$DesiredPPI
    [Nullable[int32]]$JpegQuality
    [string]$ImageType
}
