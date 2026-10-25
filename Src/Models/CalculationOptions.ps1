# CalculationOptions — Represents options for calculation.
class CalculationOptions {
    # Specifies the stack size for calculating cells recursively.
    [Nullable[int32]]$CalcStackSize
    # Indicates whether errors encountered while calculating formulas should be ignored. The error may be unsupported function, external links, etc. The default value is true.
    [Nullable[bool]]$IgnoreError
    # Specifies the strategy for processing precision of calculation.
    [string]$PrecisionStrategy
    # Indicates whether calculate the dependent cells recursively when calculating one cell and it depends on other cells. The default value is true.
    [Nullable[bool]]$Recursive
    # The custom formula calculation engine to extend the default calculation engine of Aspose.Cells.
    [AbstractCalculationEngine]$CustomEngine
    # The monitor for user to track the progress of formula calculation.
    [AbstractCalculationMonitor]$CalculationMonitor
    # Specifies the data sources for external links used in formulas.
    [Workbook[]]$LinkedDataSources
}
