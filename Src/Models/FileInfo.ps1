# FileInfo — Represents file information.
class FileInfo {
    # Represents filename.
    [string]$Filename
    # Represents file size.
    [Nullable[int64]]$FileSize
    # Represents file content, byte to base64 string.
    [string]$FileContent
}
