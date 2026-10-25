# AbstractCalculationMonitor — Monitor for user to track the progress of formula calculation.
class AbstractCalculationMonitor {
    # Gets the old value of the calculated cell. Should be used only in and .
    [object]$OriginalValue
    # Whether the cell's value has been changed after the calculation. Should be used only in .
    [Nullable[bool]]$ValueChanged
    # Gets the newly calculated value of the cell. Should be used only in .
    [object]$CalculatedValue
}
