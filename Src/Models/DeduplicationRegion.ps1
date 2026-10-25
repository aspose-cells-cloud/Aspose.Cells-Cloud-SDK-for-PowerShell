# DeduplicationRegion — Represents data deduplication region.
class DeduplicationRegion {
    # Represents data range.
    [Range[]]$Ranges
    # Represents worksheet name list.
    [string[]]$WorksheetNameList
}
