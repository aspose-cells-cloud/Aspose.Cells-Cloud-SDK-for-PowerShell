# HorizontalPageBreak — Encapsulates the object that represents a horizontal page break.
class HorizontalPageBreak {
    # Gets the zero based row index.
    [Nullable[int32]]$Row
    # Gets the end column index of this horizontal page break.
    [Nullable[int32]]$EndColumn
    # Gets the start column index of this horizontal page break.
    [Nullable[int32]]$StartColumn
}
