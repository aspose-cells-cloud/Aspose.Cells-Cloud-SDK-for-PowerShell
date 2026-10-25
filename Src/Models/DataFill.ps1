# DataFill — Represents data filling.
class DataFill {
    # Represents range of data filling.
    [Range[]]$Ranges
    # Represents that the data column is populated with the default value.
    [DataFillValue]$DataFillDefaultValue
    # Represents that the data column is populated with the specified value.
    [DataColumnFillValue[]]$DataColumnFillValueList
}
