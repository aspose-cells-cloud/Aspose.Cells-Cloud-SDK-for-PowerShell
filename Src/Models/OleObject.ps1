# OleObject — Represents an OleObject in a worksheet.
class OleObject : Shape {
    # True if the specified object is displayed as an icon and the image will not be auto changed.
    [Nullable[bool]]$DisplayAsIcon
    # Gets and sets the file type of the embedded ole object data
    [string]$FileFormatType
    # Gets or sets the path and name of the source file for the linked image.
    [string]$ImageSourceFullName
    # True indicates that the size of the ole object will be auto changed as the size of snapshot of the embedded content when the ole object is activated.
    [Nullable[bool]]$IsAutoSize
    # Returns true if the OleObject links to the file.
    [Nullable[bool]]$IsLink
    # Gets or sets the ProgID of the OLE object.
    [string]$ProgID
    # Returns the source full name of the source file for the linked OLE object.
    [string]$SourceFullName
    [Link]$Link
}
