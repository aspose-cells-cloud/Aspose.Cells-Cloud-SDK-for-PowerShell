# RemoveDuplicatesOptions — I'm here to help! Just let me know the features you would like me to summarize for you.
class RemoveDuplicatesOptions {
    # The class has a public property "Name" of type string that can be both read and written.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    # Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
    [ScopeOptions]$ScopeOptions
}
