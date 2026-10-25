# AutoFitterOptions — Represents all auto fitter options.
class AutoFitterOptions {
    # Gets and set the type of auto fitting row height of merged cells.
    [string]$AutoFitMergedCellsType
    # Ignores the hidden rows/columns.
    [Nullable[bool]]$IgnoreHidden
    # Indicates whether only fit the rows which height are not customed.
    [Nullable[bool]]$OnlyAuto
    # Gets or sets default edit language.
    [string]$DefaultEditLanguage
    # Gets and sets the max row height(in unit of Point) when autofitting rows.
    [Nullable[double]]$MaxRowHeight
    # Gets and sets the type of auto fitting wrapped text.
    [string]$AutoFitWrappedTextType
    # Gets and sets the formatted strategy.
    [string]$FormatStrategy
    # Indicates whether fit for rendering purpose.
    [Nullable[bool]]$ForRendering
}
