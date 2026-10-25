# DataColumnFillValue — Represents that the data column is populated with the specified value.
class DataColumnFillValue {
    # Represents specified column index.
    [Nullable[int32]]$ColumnIndex
    # Represents specified data fill value.
    [DataFillValue]$DataFillValue
}
