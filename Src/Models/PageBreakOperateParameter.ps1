# PageBreakOperateParameter — Represents page break operate parameter.
class PageBreakOperateParameter : OperateParameter {
    # Represents page break type.
    [string]$PageBreakType
    # Represents page break index.
    [Nullable[int32]]$Index
    # Represents row index of page break.
    [Nullable[int32]]$Row
    # Represents column index of page break.
    [Nullable[int32]]$Column
    # Represents start row index of page break.
    [Nullable[int32]]$StartIndex
    # Represents end row index of page break.
    [Nullable[int32]]$EndIndex
}
