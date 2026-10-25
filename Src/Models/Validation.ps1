# Validation — Represents data validation.settings.
class Validation : LinkElement {
    # Represents the validation alert style.
    [string]$AlertStyle
    # Represents a collection of Aspose.Cells.CellArea which contains the data validation settings.
    [CellArea[]]$AreaList
    # Represents the data validation error message.
    [string]$ErrorMessage
    # Represents the title of the data-validation error dialog box.
    [string]$ErrorTitle
    # Represents the value or expression associated with the data validation.
    [string]$Formula1
    # Represents the value or expression associated with the data validation.
    [string]$Formula2
    # Indicates whether blank values are permitted by the range data validation.
    [Nullable[bool]]$IgnoreBlank
    # Indicates whether data validation displays a drop-down list that contains acceptable values.
    [Nullable[bool]]$InCellDropDown
    # Represents the data validation input message.
    [string]$InputMessage
    # Represents the title of the data-validation input dialog box.
    [string]$InputTitle
    # Represents the operator for the data validation.
    [string]$Operator
    # Indicates whether the data validation error message will be displayed whenever the user enters invalid data.
    [Nullable[bool]]$ShowError
    # Indicates whether the data validation input message will be displayed whenever the user selects a cell in the data validation range.
    [Nullable[bool]]$ShowInput
    # Represents the data validation type.
    [string]$Type
    # Represents the first value associated with the data validation.
    [string]$Value1
    # Represents the second value associated with the data validation.
    [string]$Value2
}
