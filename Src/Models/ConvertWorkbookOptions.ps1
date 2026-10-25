# ConvertWorkbookOptions
class ConvertWorkbookOptions {
    # The class has a public property named "Name" with a getter and setter method.
    [string]$Name
    [DataSource]$DataSource
    [FileInfo]$FileInfo
    [PageSetup]$PageSetup
    [SaveOptions]$SaveOptions
    [string]$ConvertFormat
    [Nullable[bool]]$CheckExcelRestriction
}
