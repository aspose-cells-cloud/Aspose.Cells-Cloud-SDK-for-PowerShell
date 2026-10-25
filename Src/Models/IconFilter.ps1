# IconFilter — Represents icon filter.
class IconFilter {
    # Gets and sets Zero-based index of an icon in an icon set.
    [Nullable[int32]]$IconId
    # Gets and sets which icon set is used in the filter criteria.
    [string]$IconSetType
}
