# DataQuery — Data query.
class DataQuery {
    # Define a name for data query. Unique identification.
    [string]$Name
    # The specific data object type. When the value is File, DataItem is invalid.
    [string]$DataSourceDataType
    # Indicates the source of the mount data.
    [DataSource]$DataSource
    # When data souce is request files, FileInfo store the contents of the file.
    [FileInfo]$FileInfo
    # The specific data object type and name.
    [DataItem]$DataItem
}
