# Worksheet — Encapsulates the object that represents a single worksheet.
class Worksheet {
    # Property Summary: Contains a list of links represented by the class link.
    [Link[]]$Links
    # Indicates if the specified worksheet is displayed from right to left instead of from left to right. Default is false.
    [Nullable[bool]]$DisplayRightToLeft
    # True if zero values are displayed.
    [Nullable[bool]]$DisplayZeros
    # Represents first visible column index.
    [Nullable[int32]]$FirstVisibleColumn
    # Represents first visible row index.
    [Nullable[int32]]$FirstVisibleRow
    # Gets or sets the name of the worksheet.
    [string]$Name
    # Gets the index of sheet in the worksheet collection.
    [Nullable[int32]]$Index
    # Gets or sets a value indicating whether the gridlines are visible.Default is true.
    [Nullable[bool]]$IsGridlinesVisible
    # Indicates whether to show outline.
    [Nullable[bool]]$IsOutlineShown
    # Indicates whether the specified worksheet is shown in normal view or page break preview.
    [Nullable[bool]]$IsPageBreakPreview
    # Represents if the worksheet is visible.
    [Nullable[bool]]$IsVisible
    # Indicates if the worksheet is protected.
    [Nullable[bool]]$IsProtected
    # Gets or sets a value indicating whether the worksheet will display row and column headers. Default is true.
    [Nullable[bool]]$IsRowColumnHeadersVisible
    # Indicates whether the ruler is visible. This property is only applied for page break preview.
    [Nullable[bool]]$IsRulerVisible
    # Indicates whether this worksheet is selected when the workbook is opened.
    [Nullable[bool]]$IsSelected
    # Represents worksheet tab color.
    [Color]$TabColor
    # Indicates whether the Transition Formula Entry (Lotus compatibility) option is enabled.
    [Nullable[bool]]$TransitionEntry
    # Indicates whether the Transition Formula Evaluation (Lotus compatibility) option is enabled.
    [Nullable[bool]]$TransitionEvaluation
    # Represents worksheet type.
    [string]$Type
    # Gets and sets the view type.
    [string]$ViewType
    # Indicates the visible state for this sheet.
    [string]$VisibilityType
    # Represents the scaling factor in percentage. It should be between 10 and 400.
    [Nullable[int32]]$Zoom
    # Gets the collection.
    [LinkElement]$Cells
    # Gets a collection
    [LinkElement]$Charts
    [LinkElement]$AutoShapes
    # Represents a collection of in a worksheet.
    [LinkElement]$OleObjects
    # Gets the collection.
    [LinkElement]$Comments
    # Gets a collection.
    [LinkElement]$Pictures
    [LinkElement]$MergedCells
    # Gets the data validation setting collection in the worksheet.
    [LinkElement]$Validations
    # Gets the ConditionalFormattings in the worksheet.
    [LinkElement]$ConditionalFormattings
    # Gets the collection.
    [LinkElement]$Hyperlinks
}
