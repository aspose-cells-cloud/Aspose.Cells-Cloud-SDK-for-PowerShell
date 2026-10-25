# FormulaSettings — Settings of formulas and calculation.
class FormulaSettings {
    # Indicates whether the application is required to perform a full calculation when the workbook is opened.
    [Nullable[bool]]$CalculateOnOpen
    # Indicates whether recalculate the workbook before saving the document, when in manual calculation mode.
    [Nullable[bool]]$CalculateOnSave
    # Indicates whether calculates all formulas every time when a calculation is triggered.
    [Nullable[bool]]$ForceFullCalculation
    # Gets or sets the mode for workbook calculation in ms excel.
    [string]$CalculationMode
    # Specifies the version of the calculation engine used to calculate values in the workbook.
    [string]$CalculationId
    # Indicates whether enable iterative calculation to resolve circular references.
    [Nullable[bool]]$EnableIterativeCalculation
    # The maximum iterations to resolve a circular reference.
    [Nullable[int32]]$MaxIteration
    # The maximum change to resolve a circular reference.
    [Nullable[double]]$MaxChange
    # Whether the precision of calculated result be set as they are displayed while calculating formulas
    [Nullable[bool]]$PrecisionAsDisplayed
    # Whether enable calculation chain for formulas. Default is false.
    [Nullable[bool]]$EnableCalculationChain
    # Indicates whether preserve those spaces and line breaks that are padded between formula tokens while getting and setting formulas. Default value is false.
    [Nullable[bool]]$PreservePaddingSpaces
}
