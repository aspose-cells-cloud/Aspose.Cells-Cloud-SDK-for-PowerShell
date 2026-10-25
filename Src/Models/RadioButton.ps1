# RadioButton — Represents a radio button.
class RadioButton : Shape {
    # Gets the GroupBox that contains this RadioButton.
    [GroupBox]$GroupBox
    # Indicates if the radiobutton is checked or not.
    [Nullable[bool]]$IsChecked
    # Indicates whether the combobox has 3-D shading.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
