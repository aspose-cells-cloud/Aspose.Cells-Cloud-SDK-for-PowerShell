# CheckBox — Represents a check box object in a worksheet.
class CheckBox : Shape {
    # Gets or set checkbox' value.
    [string]$CheckedValue
    # Indicates whether the combobox has 3-D shading.
    [Nullable[bool]]$Shadow
    # Indicates if the checkbox is checked or not.
    [Nullable[bool]]$Value
    [Link]$Link
}
