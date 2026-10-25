# ConvertWorksheetTaskParameter — Represents convert worksheet task parameter.
class ConvertWorksheetTaskParameter : TaskParameter {
    # Represents data source of task object.
    [DataSource]$DataSource
    # Represents data source of task object.
    [FileSource]$Workbook
    # Represents worksheet.
    [string]$Sheet
    # Represents destination data source.
    [DataSource]$TargetDataSource
    # Represents destination data source.
    [FileSource]$Target
    # Represents destination data format.
    [string]$Format
    # Represents converted data area.
    [string]$Area
    # Represents converted page index.
    [Nullable[int32]]$PageIndex
    # Represents vertical resolution.
    [Nullable[int32]]$VerticalResolution
    # Represents horizontal resolution.
    [Nullable[int32]]$HorizontalResolution
}
