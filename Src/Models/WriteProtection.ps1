# WriteProtection — Specifies write protection settings for a workbook.
class WriteProtection {
    # Gets and sets the author.
    [string]$Author
    # Indicates if the Read Only Recommended option is selected.
    [Nullable[bool]]$RecommendReadOnly
    # Indicates whether this workbook is write protected.
    [Nullable[bool]]$IsWriteProtected
    # Sets the protected password to modify the file.
    [string]$Password
}
