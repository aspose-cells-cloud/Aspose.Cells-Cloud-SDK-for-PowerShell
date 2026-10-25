# WorksheetMovingRequest — Used by workbook moving requests.
class WorksheetMovingRequest {
    # Destination worksheet name.
    [string]$DestinationWorksheet
    # Position to move. Can be BEFORE or AFTER.
    [string]$Position
}
