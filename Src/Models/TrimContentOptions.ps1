# TrimContentOptions
class TrimContentOptions {
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    # Trim Content
    [string]$TrimContent
    # If the trim leading value is true, the trim content before and after cell values will be deleted.
    [Nullable[bool]]$TrimLeading
    # If the trim trailing value is true, the trim content before and after cell values will be deleted.
    [Nullable[bool]]$TrimTrailing
    # When the trim space between word to 1 parameter is true, it enables the removal of extra spaces between words within a cell, ensuring that only a single space is maintained between words.
    [Nullable[bool]]$TrimSpaceBetweenWordTo1
    [Nullable[bool]]$TrimNonBreakingSpaces
    # When this parameter is enabled (set to True), it deletes extra line breaks within the selected range, ensuring that only necessary line breaks are retained.
    [Nullable[bool]]$RemoveExtraLineBreaks
    # When this parameter is enabled (set to True), it removes all line breaks within the selected range, resulting in a continuous block of text without any line breaks.
    [Nullable[bool]]$RemoveAllLineBreaks
    # Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
    [ScopeOptions]$ScopeOptions
}
