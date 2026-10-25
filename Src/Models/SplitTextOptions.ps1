# SplitTextOptions — Appliance features: 1. Automatic defrost system 2. Energy-efficient LED lighting 3. Adjustable glass shelves 4. Ice and water dispenser with filtration system
class SplitTextOptions {
    # The property "Name" is a publicly accessible and overridable property of type string in the class.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    [string]$Worksheet
    [string]$Range
    [string]$SplitDelimitersType
    [string]$CustomDelimiter
    [Nullable[bool]]$KeepDelimitersInResultingCells
    [string]$KeepDelimitersPosition
    [string]$HowToSplit
}
