# LoadOptions — Represents the options of loading the file.
class LoadOptions {
    # This class has a public property named "ConvertNumericData" of type string that can be read from and written to.
    [string]$ConvertNumericData
    # Gets and sets the interrupt monitor.
    [string]$InterruptMonitor
    # Gets or sets the user interface language of the Workbook version based on CountryCode that has saved the file.
    [string]$LanguageCode
    [string]$LoadDataOptions
    # Gets the load format.
    [string]$LoadFormat
    [string]$OnlyLoadDocumentProperties
    # Indicates whether parsing the formula when reading the file.
    [string]$ParsingFormulaOnOpen
    # Gets and set the password of the workbook.
    [string]$Password
    # Gets or sets the system regional settings based on CountryCode at the time the file was loaded.
    [string]$Region
    # Sets the default standard font name
    [string]$StandardFont
    # Sets the default standard font size.
    [Nullable[double]]$StandardFontSize
}
