# WorkbookSettings — Represents all settings of the workbook.
class WorkbookSettings {
    # Specifies a boolean value that indicates the application automatically compressed pictures in the workbook.
    [Nullable[bool]]$AutoCompressPictures
    # Indicates whether the file is mark for auto-recovery.
    [Nullable[bool]]$AutoRecover
    # Specifies the incremental public release of the application.
    [string]$BuildVersion
    # It specifies whether to calculate formulas manually, automatically or automatically except for multiple table operations.
    [string]$CalcMode
    # Specifies the version of the calculation engine used to calculate values in the workbook.
    [string]$CalculationId
    # Indicates whether check comptiliblity when saving workbook. Remarks: The default value is true.
    [Nullable[bool]]$CheckComptiliblity
    # Whether check restriction of excel file when user modify cells related objects. For example, excel does not allow inputting string value longer than 32K. When you input a value longer than 32K such as by Cell.PutValue(string), if this property is true, you will get an Exception. If this property is false, we will accept your input string value as the cell's value so that later you can output the complete string value for other file formats such as CSV. However, if you have set such kind of value that is invalid for excel file format, you should not save the workbook as excel file format later. Otherwise there may be unexpected error for the generated excel file.
    [Nullable[bool]]$CheckExcelRestriction
    # indicates whether the application last saved the workbook file after a crash.
    [Nullable[bool]]$CrashSave
    # Whether creates calculated formulas chain. Default is false.
    [Nullable[bool]]$CreateCalcChain
    # indicates whether the application last opened the workbook for data recovery.
    [Nullable[bool]]$DataExtractLoad
    # Gets or sets a value which represents if the workbook uses the 1904 date system.
    [Nullable[bool]]$Date1904
    # Indicates whether and how to show objects in the workbook.
    [string]$DisplayDrawingObjects
    # Enable macros;
    [Nullable[bool]]$EnableMacros
    # Gets or sets the first visible worksheet tab.
    [Nullable[int32]]$FirstVisibleTab
    # Gets and sets whether hide the field list for the PivotTable.
    [Nullable[bool]]$HidePivotFieldList
    # Indicates whether encrypting the workbook with default password if Structure and Windows of the workbook are locked.
    [Nullable[bool]]$IsDefaultEncrypted
    # Indicates whether this workbook is hidden.
    [Nullable[bool]]$IsHidden
    # Gets or sets a value indicating whether the generated spreadsheet will contain a horizontal scroll bar.
    [Nullable[bool]]$IsHScrollBarVisible
    # Represents whether the generated spreadsheet will be opened Minimized.
    [Nullable[bool]]$IsMinimized
    # Gets or sets a value indicating whether the generated spreadsheet will contain a vertical scroll bar.
    [Nullable[bool]]$IsVScrollBarVisible
    # Indicates whether enable iterative calculation to resolve circular references.
    [Nullable[bool]]$Iteration
    # Gets or sets the user interface language of the Workbook version based on CountryCode that has saved the file.
    [string]$LanguageCode
    # Returns or sets the maximum number of change to resolve a circular reference.
    [Nullable[double]]$MaxChange
    # Returns or sets the maximum number of iterations to resolve a circular reference.
    [Nullable[int32]]$MaxIteration
    # Gets or sets the memory usage options. The new option will be taken as the default option for newly created worksheets but does not take effect for existing worksheets.
    [string]$MemorySetting
    # Gets or sets the decimal separator for formatting/parsing numeric values. Default is the decimal separator of current Region.
    [string]$NumberDecimalSeparator
    # Gets or sets the character that separates groups of digits to the left of the decimal in numeric values. Default is the group separator of current Region.
    [string]$NumberGroupSeparator
    # Indicates whether parsing the formula when reading the file.
    [Nullable[bool]]$ParsingFormulaOnOpen
    # True if calculations in this workbook will be done using only the precision of the numbers as they're displayed
    [Nullable[bool]]$PrecisionAsDisplayed
    # Indicates whether to recalculate before saving the document.
    [Nullable[bool]]$RecalculateBeforeSave
    # Indicates whether re-calculate all formulas on opening file.
    [Nullable[bool]]$ReCalculateOnOpen
    # Indicates if the Read Only Recommended option is selected.
    [Nullable[bool]]$RecommendReadOnly
    # Gets or sets the regional settings for workbook.
    [string]$Region
    # True if personal information can be removed from the specified workbook.
    [Nullable[bool]]$RemovePersonalInformation
    # Indicates whether the application last opened the workbook in safe or repair mode.
    [Nullable[bool]]$RepairLoad
    # Gets or sets a value that indicates whether the Workbook is shared.
    [Nullable[bool]]$Shared
    # Width of worksheet tab bar (in 1/1000 of window width).
    [Nullable[int32]]$SheetTabBarWidth
    # Get or sets a value whether the Workbook tabs are displayed.
    [Nullable[bool]]$ShowTabs
    # Indicates whether update adjacent cells' border.
    [Nullable[bool]]$UpdateAdjacentCellsBorder
    # Gets and sets how updates external links when the workbook is opened.
    [string]$UpdateLinksType
    # The height of the window, in unit of point.
    [Nullable[double]]$WindowHeight
    # The distance from the left edge of the client area to the left edge of the window, in unit of point.
    [Nullable[double]]$WindowLeft
    # The distance from the top edge of the client area to the top edge of the window, in unit of point.
    [Nullable[double]]$WindowTop
    # The width of the window, in unit of point.
    [Nullable[double]]$WindowWidth
    # Gets and sets the author of the file.
    [string]$Author
    # Indicates whether checking custom number format when setting Style.Custom.
    [Nullable[bool]]$CheckCustomNumberFormat
    # Gets the protection type of the workbook.
    [string]$ProtectionType
    # Gets and sets the globalization settings.
    [GlobalizationSettings]$GlobalizationSettings
    # Represents Workbook file encryption password.
    [string]$Password
    # Provides access to the workbook write protection options.
    [WriteProtection]$WriteProtection
    # Gets a value that indicates whether a password is required to open this workbook.
    [Nullable[bool]]$IsEncrypted
    # Gets a value that indicates whether the structure or window of the Workbook is protected.
    [Nullable[bool]]$IsProtected
    # Gets the max row index, zero-based.
    [Nullable[int32]]$MaxRow
    # Gets the max column index, zero-based.
    [Nullable[int32]]$MaxColumn
    # Gets and sets the number of significant digits. The default value is .
    [Nullable[int32]]$SignificantDigits
    # Indicates whether check compatibility with earlier versions when saving workbook.
    [Nullable[bool]]$CheckCompatibility
    # Gets and sets the default print paper size.
    [string]$PaperSize
    # Gets and sets the max row number of shared formula.
    [Nullable[int32]]$MaxRowsOfSharedFormula
    # Specifies the OOXML version for the output document. The default value is Ecma376_2006.
    [string]$Compliance
    # Indicates whether setting property when entering the string value(which starts with single quote mark ) to the cell
    [Nullable[bool]]$QuotePrefixToStyle
    # Gets the settings for formula-related features.
    [FormulaSettings]$FormulaSettings
    # Fully calculates every time when a calculation is triggered.
    [Nullable[bool]]$ForceFullCalculate
}
