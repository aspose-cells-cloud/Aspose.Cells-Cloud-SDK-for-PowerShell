# Picture — Encapsulates the object that represents a single picture in a spreadsheet.
class Picture : Shape {
    # Represents the of the border line of a picture.
    [Color]$BorderLineColor
    # Gets or sets the weight of the border line of a picture in units of pt.
    [Nullable[double]]$BorderWeight
    # Gets the original height of the picture.
    [Nullable[int32]]$OriginalHeight
    # Gets the original width of the picture.
    [Nullable[int32]]$OriginalWidth
    # This class has a property called "ImageFormat" that allows getting and setting a string value.
    [string]$ImageFormat
    # Gets or sets the path and name of the source file for the linked image.
    [string]$SourceFullName
    [Link]$Link
}
