# DataOutputLocation
class DataOutputLocation {
    [DataSource]$DataSource
    [FileInfo]$FileInfo
    [string]$Worksheet
    [Nullable[int32]]$BeginRowIndex
    [Nullable[int32]]$BeginColumnIndex
}
