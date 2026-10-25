# WorksheetReplaceResponse — Represents the WorksheetReplace Response.
class WorksheetReplaceResponse : CellsCloudResponse {
    # "An integer property named Matches decorated with the XmlElement attribute."
    [Nullable[int32]]$Matches
    [LinkElement]$Worksheet
}
