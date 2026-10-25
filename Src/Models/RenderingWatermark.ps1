# RenderingWatermark
class RenderingWatermark {
    [Nullable[double]]$Rotation
    [Nullable[int32]]$ScaleToPagePercent
    [Nullable[double]]$Opacity
    [Nullable[bool]]$IsBackground
    [string]$Text
    [RenderingFont]$Font
    [byte[][]]$Image
    [string]$HAlignment
    [string]$VAlignment
    [Nullable[double]]$OffsetX
    [Nullable[double]]$OffsetY
}
