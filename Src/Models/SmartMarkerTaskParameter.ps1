# SmartMarkerTaskParameter — Represents smart marker task parameter.
class SmartMarkerTaskParameter : TaskParameter {
    # Represents data source of task object.
    [FileSource]$SourceWorkbook
    # Represents data source of task object.
    [FileSource]$DestinationWorkbook
    # Represents xml file.
    [FileSource]$XmlFile
    # Represents destination data source.
    [DataSource]$DataSource
    # Represents destination data source.
    [DataSource]$TargetDataSource
    # Represents xml file.
    [DataSource]$XMLFileDataSource
}
