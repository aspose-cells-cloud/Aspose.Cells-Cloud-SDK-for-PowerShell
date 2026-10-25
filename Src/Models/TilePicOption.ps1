# TilePicOption — Represents tile picture as texture.
class TilePicOption {
    # Gets or sets the X offset for tiling picture.
    [Nullable[double]]$OffsetX
    # Gets or sets the Y offset for tiling picture.
    [Nullable[double]]$OffsetY
    # Gets or sets the X scale for tiling picture.
    [Nullable[double]]$ScaleX
    # Gets or sets the Y scale for tiling picture.
    [Nullable[double]]$ScaleY
    # Gets or sets the alignment for tiling.
    [string]$AlignmentType
    # Gets or sets the mirror type for tiling.
    [string]$MirrorType
}
