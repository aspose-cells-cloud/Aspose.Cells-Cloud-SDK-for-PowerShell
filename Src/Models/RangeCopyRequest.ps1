# RangeCopyRequest — Indicates range copy request
class RangeCopyRequest {
    # copydata, copystyle, copyto, copyvalue.
    [string]$Operate
    # Source range.
    [Range]$Source
    # Target range.
    [Range]$Target
    [string]$TargetWorkbook
    # Represents the paste special options.
    [PasteOptions]$PasteOptions
}
