# ComboBox — Represents the control form ComboBox.
class ComboBox : Shape {
    # Gets or sets the number of list lines displayed in the drop-down portion of a combo box.
    [Nullable[int32]]$DropDownLines
    # Property Summary: Contains a public string property named "InputRange" with both get and set accessors.
    [string]$InputRange
    # Gets the selected cell in the input range of the combo box.
    [LinkElement]$SelectedCell
    # Gets or sets the index number of the currently selected item in a list box or combo box. Zero-based.
    [Nullable[int32]]$SelectedIndex
    # Gets the selected value of the combox box.
    [string]$SelectedValue
    # Indicates whether the combobox has 3-D shading.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
