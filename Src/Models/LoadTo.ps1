# LoadTo — A description of the location to which the data is mounted.
class LoadTo {
    # The worksheet name.
    [string]$Worksheet
    # The begin row index of worksheet.
    [Nullable[int32]]$BeginRowIndex
    # The begin column index of worksheet.
    [Nullable[int32]]$BeginColumnIndex
}
