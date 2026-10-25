# PasteOptions — Represents the paste special options.
class PasteOptions {
    # True means only copying visible cells.
    [Nullable[bool]]$OnlyVisibleCells
    # The paste special type.
    [string]$PasteType
    # Indicates whether skips blank cells.
    [Nullable[bool]]$SkipBlanks
    # True to transpose rows and columns when the range is pasted. The default value is False.
    [Nullable[bool]]$Transpose
}
