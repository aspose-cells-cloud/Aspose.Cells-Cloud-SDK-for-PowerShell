# RangeConvertRequest — Indicates range copy request
class RangeConvertRequest {
    # Source range.
    [Range]$Source
    # Target range.
    [string]$ImageType
    # Represents the paste special options.
    [ImageOrPrintOptions]$ImageOrPrintOptions
    [PageSetup]$PageSetup
}
