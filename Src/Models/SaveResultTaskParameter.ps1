# SaveResultTaskParameter — Represents save result task parameter.
class SaveResultTaskParameter : TaskParameter {
    # Represents result data source.
    [string]$ResultSource
    # Represents result destination data.
    [ResultDestination]$ResultDestination
}
