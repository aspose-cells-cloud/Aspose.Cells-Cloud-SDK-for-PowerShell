# ImportDataTaskParameter — Represents import data task parameter.
class ImportDataTaskParameter : TaskParameter {
    # Represents data source of task object.
    [DataSource]$DataSource
    # Represents data source of task object.
    [FileSource]$Workbook
    # Represents import option.
    [ImportOption]$ImportOption
    # Represents destination data source.
    [DataSource]$TargetDataSource
    # Represents destination data source.
    [FileSource]$DestinationWorkbook
}
