# TableTotalRequest — Indicates table total request
class TableTotalRequest {
    # Indicates list column index.
    [Nullable[int32]]$ListColumnIndex
    # Indicates totals calculation.
    [string]$TotalsCalculation
    # Indicates custom formula.
    [string]$CustomFormula
}
