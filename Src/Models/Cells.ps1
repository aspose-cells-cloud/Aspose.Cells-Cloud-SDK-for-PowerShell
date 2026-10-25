# Cells — Encapsulates a collection of cell relevant objects, such as Aspose.Cells.Cell, Aspose.Cells.Row, ...etc.
class Cells : LinkElement {
    # Maximum row index of cell which contains data or style.
    [Nullable[int32]]$MaxRow
    # Maximum column index of those cells that have been instantiated in the collection(does not include the column where style is defined for the whole column but no cell has been instantiated in it).
    [Nullable[int32]]$MaxColumn
    # The class has a public property "CellCount" of type integer that can be read and modified.
    [Nullable[int32]]$CellCount
    # Gets the collection of objects that represents the individual rows in this worksheet.
    [LinkElement]$Rows
    # Gets the collection of objects that represents the individual columns in this worksheet.
    [LinkElement]$Columns
    [LinkElement[]]$CellList
}
