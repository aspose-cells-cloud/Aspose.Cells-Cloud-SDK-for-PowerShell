# ConvertTaskParameter — Represents convert task parameter.
class ConvertTaskParameter : TaskParameter {
    # Represents data source of task object.
    [DataSource]$DataSource
    # Represents data source of task object.
    [FileSource]$Workbook
    # Represents destination file.
    [string]$DestinationFile
    # Represents Excel data region.
    [string]$Region
    # Represents save options.
    [SaveOptions]$SaveOptions
}
