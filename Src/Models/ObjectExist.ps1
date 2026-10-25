# ObjectExist — Object exists
class ObjectExist {
    # Indicates that the file or folder exists.
    [Nullable[bool]]$Exists
    # True if it is a folder, false if it is a file.
    [Nullable[bool]]$IsFolder
}
