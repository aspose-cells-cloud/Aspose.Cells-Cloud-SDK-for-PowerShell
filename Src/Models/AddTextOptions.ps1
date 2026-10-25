# AddTextOptions — Class summary: The features of this class include hands-on learning activities, group projects, interactive discussions, guest speakers, and field trips to real-world applications.
class AddTextOptions {
    # The class has a public property named "Name" with a getter and setter method.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    # Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
    [ScopeOptions]$ScopeOptions
    # Add text content.
    [string]$Text
    # Represents where text should be inserted or selected in the spreadsheet.
    [string]$SelectPoistion
    # Selected text of cell where text should be inserted or selected in the spreadsheet.
    [string]$SelectText
    # Indicates whether empty cells should be skipped during processing.
    [Nullable[bool]]$SkipEmptyCells
}
