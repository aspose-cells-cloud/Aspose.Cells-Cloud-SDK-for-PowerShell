# Workbook — Represents a root object to create an Excel spreadsheet.
class Workbook {
    # Gets and sets the current file name.
    [string]$FileName
    # A property of type List Link named Links is specified to be serialized as an XmlElement with the tag "link".
    [Link[]]$Links
    # Gets the collection in the spreadsheet.
    [LinkElement]$Worksheets
    # Gets or sets the default object of the workbook.
    [LinkElement]$DefaultStyle
    [LinkElement]$DocumentProperties
    [LinkElement]$Names
    # Represents the workbook settings.
    [LinkElement]$Settings
    [string]$IsWriteProtected
    [string]$IsProtected
    [string]$IsEncryption
    [string]$Password
}
