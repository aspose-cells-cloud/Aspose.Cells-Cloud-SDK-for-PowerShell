# SplitWorkbookTaskParameter — Represents split workbook task parameter.
class SplitWorkbookTaskParameter : TaskParameter {
    # Represents data source of task object.
    [FileSource]$Workbook
    # Represents data source of task object.
    [FileSource]$DestinationFilePosition
    # Represents destination data source.
    [DataSource]$DataSource
    # Represents destination data source.
    [DataSource]$TargetDataSource
    # Represents destination data file format.
    [string]$DestinationFileFormat
    # SheetName /NewGuid
    [string]$SplitNameRule
    # When destination file format is image , vertical resolution can not be null.
    [Nullable[int32]]$VerticalResolution
    # When destination file format is image , horizontal resolution can not be null.
    [Nullable[int32]]$HorizontalResolution
}
