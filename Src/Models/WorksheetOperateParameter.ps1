# WorksheetOperateParameter — Represents worksheet operate parameter.
class WorksheetOperateParameter : OperateParameter {
    # Represents worksheet name.
    [string]$Name
    # Represents worksheet type.
    [string]$SheetType
    # rename worksheet name
    [string]$NewName
    # Represents move position.
    [WorksheetMovingRequest]$MovingRequest
}
