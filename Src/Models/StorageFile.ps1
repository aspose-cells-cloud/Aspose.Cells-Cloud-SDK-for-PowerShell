# StorageFile — File or folder information
class StorageFile {
    # File or folder name.
    [string]$Name
    # True if it is a folder.
    [Nullable[bool]]$IsFolder
    # File or folder last modified DateTime.
    [Nullable[DateTime]]$ModifiedDate
    # File or folder size.
    [Nullable[int64]]$Size
    # File or folder path.
    [string]$Path
}
