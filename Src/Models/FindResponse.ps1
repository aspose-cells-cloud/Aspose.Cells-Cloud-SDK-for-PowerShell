# FindResponse — Represents the Find Response.
class FindResponse : CellsCloudResponse {
    # Property Summary: This property is annotated with the XML element name "count" and represents an integer value.
    [Nullable[int32]]$Count
    [TextItems]$TextItems
}
