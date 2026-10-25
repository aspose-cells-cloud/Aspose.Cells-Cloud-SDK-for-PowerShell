# ConvertWorksheetOptions
class ConvertWorksheetOptions {
    # The class has a public property named "Name" with a getter and setter method.
    [string]$Name
    [DataSource]$DataSource
    [FileInfo]$FileInfo
    [string]$WorksheetName
    [PageSetup]$PageSetup
    [ImageOrPrintOptions]$ImageOrPrintOptions
    [string]$ConvertFormat
    [Nullable[bool]]$CheckExcelRestriction
    [string]$Region
}
