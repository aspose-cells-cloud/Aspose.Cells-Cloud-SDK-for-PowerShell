# TextWaterMarkerRequest — Indicates text water marker request.
class TextWaterMarkerRequest {
    # A property named Text of type string that can be accessed and modified.
    [string]$Text
    # Indicates font name.
    [string]$FontName
    # Indicates font size.
    [Nullable[int32]]$FontSize
    # Indicates image height.
    [Nullable[int32]]$Height
    # Indicates image width.
    [Nullable[int32]]$Width
    [string]$ImageAdaptOption
}
