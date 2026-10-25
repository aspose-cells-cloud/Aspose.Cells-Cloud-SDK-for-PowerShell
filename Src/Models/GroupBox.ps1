# GroupBox — Encapsulates the object that represents a groupbox in a spreadsheet.
class GroupBox : Shape {
    # Indicates whether the groupbox has shadow.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
