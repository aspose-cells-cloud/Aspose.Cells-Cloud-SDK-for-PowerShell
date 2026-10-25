# Protection — Represents the various types of protection options available for a worksheet.
class Protection {
    # Represents if the deletion of columns is allowed on a protected worksheet.
    [Nullable[bool]]$AllowDeletingColumn
    # Represents if the deletion of rows is allowed on a protected worksheet.
    [Nullable[bool]]$AllowDeletingRow
    # Represents if the user is allowed to make use of an AutoFilter that was created before the sheet was protected.
    [Nullable[bool]]$AllowFiltering
    # Represents if the formatting of cells is allowed on a protected worksheet.
    [Nullable[bool]]$AllowFormattingCell
    # Represents if the formatting of columns is allowed on a protected worksheet
    [Nullable[bool]]$AllowFormattingColumn
    # Represents if the formatting of rows is allowed on a protected worksheet
    [Nullable[bool]]$AllowFormattingRow
    # Represents if the insertion of columns is allowed on a protected worksheet
    [Nullable[bool]]$AllowInsertingColumn
    # Represents if the insertion of hyperlinks is allowed on a protected worksheet
    [Nullable[bool]]$AllowInsertingHyperlink
    # Represents if the insertion of rows is allowed on a protected worksheet
    [Nullable[bool]]$AllowInsertingRow
    # Represents if the sorting option is allowed on a protected worksheet.
    [Nullable[bool]]$AllowSorting
    # Represents if the user is allowed to manipulate pivot tables on a protected worksheet.
    [Nullable[bool]]$AllowUsingPivotTable
    # Represents if the user is allowed to edit contents of locked cells on a protected worksheet.
    [Nullable[bool]]$AllowEditingContent
    # Represents if the user is allowed to manipulate drawing objects on a protected worksheet.
    [Nullable[bool]]$AllowEditingObject
    # Represents if the user is allowed to edit scenarios on a protected worksheet.
    [Nullable[bool]]$AllowEditingScenario
    # Represents the password to protect the worksheet.
    [string]$Password
    # Represents if the user is allowed to select locked cells on a protected worksheet.
    [Nullable[bool]]$AllowSelectingLockedCell
    # Represents if the user is allowed to select unlocked cells on a protected worksheet.
    [Nullable[bool]]$AllowSelectingUnlockedCell
}
