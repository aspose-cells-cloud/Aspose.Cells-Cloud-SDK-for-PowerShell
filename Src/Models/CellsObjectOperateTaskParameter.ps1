# CellsObjectOperateTaskParameter — Represents cells object operate task parameter.
class CellsObjectOperateTaskParameter : TaskParameter {
    # Represents object operate.
    [OperateObject]$OperateObject
    # Represents operate parameter.
    [OperateParameter]$OperateParameter
    # Represents destination data source.
    [DataSource]$DestinationDataSource
    # Represents destination data source.
    [FileSource]$DestinationWorkbook
}
