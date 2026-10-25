# ListColumn — Represents a column in a Table.
class ListColumn {
    # Gets and sets the name of the column.
    [string]$Name
    # Gets the range of this list column.
    [Range]$Range
    # Gets and sets the type of calculation in the Totals row of the list column.
    [string]$TotalsCalculation
    # Gets and sets the formula of the list column.
    [string]$Formula
    # Gets and sets the display labels of total row.
    [string]$TotalsRowLabel
}
