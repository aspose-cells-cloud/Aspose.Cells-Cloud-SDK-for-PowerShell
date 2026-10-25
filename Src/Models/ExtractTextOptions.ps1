# ExtractTextOptions — I'm happy to help! Could you please provide me with the features you would like me to summarize for you?
class ExtractTextOptions {
    # This class has a public property for storing and retrieving a name value.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    [string]$Worksheet
    [string]$Range
    [string]$ExtractTextType
    [string]$BeforeText
    [string]$AfterText
    [Nullable[int32]]$BeforePosition
    [Nullable[int32]]$AfterPosition
    [string]$OutPositionRange
}
