# Form — I'm happy to help! Please provide the features you would like me to summarize into one sentence for the class.
class Form : Shape {
    # A property named "FormType" of type string which can be both accessed and modified.
    [string]$FormType
    [string]$CheckedValue
    [Nullable[bool]]$Shadow
    [string]$InputRange
    [Nullable[int32]]$SelectedIndex
    [string]$SelectedValue
    [LinkElement]$SelectedCell
    [Nullable[int32]]$DropDownLines
    [Nullable[int32]]$ItemCount
    [LinkElement[]]$SelectedCells
    [string]$SelectionType
    [Nullable[bool]]$IsChecked
    [Nullable[int32]]$CurrentValue
    [Nullable[int32]]$Min
    [Nullable[int32]]$Max
    [Nullable[int32]]$IncrementalChange
    [Nullable[int32]]$PageChange
    [Nullable[bool]]$IsHorizontal
    [Link]$Link
}
