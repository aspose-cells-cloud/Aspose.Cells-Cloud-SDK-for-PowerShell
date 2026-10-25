# ListBox — Represents a list box object.
class ListBox : Shape {
    # This property stores the input range for the class.
    [string]$InputRange
    # Gets the number of items in the list box.
    [Nullable[int32]]$ItemCount
    # Specifies the amount by which the control's value is changed when the user clicks on the scrollbar's page up or page down region.
    [Nullable[int32]]$PageChange
    # Gets the selected cells. Returns null if the input range is not set or no item is selected
    [LinkElement[]]$SelectedCells
    # Gets or sets the index number of the currently selected item in a list box or combo box. Zero-based.
    [Nullable[int32]]$SelectedIndex
    # Gets or sets the selection mode of the specified list box.
    [string]$SelectionType
    # Indicates whether the combobox has 3-D shading.
    [Nullable[bool]]$Shadow
    [Link]$Link
}
