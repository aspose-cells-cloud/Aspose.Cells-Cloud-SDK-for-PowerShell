# ConvertTextOptions — Class summary: The features of the new smartphone include a high-resolution display, multiple camera lenses for versatile photography, a fast processor for seamless performance, and a larger battery for extended usage time.
class ConvertTextOptions {
    # The class has a public property called "Name" of type string that can be accessed and modified.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    # Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
    [ScopeOptions]$ScopeOptions
    [string]$ConvertTextType
    [string]$SourceCharacters
    [string]$TargetCharacters
}
