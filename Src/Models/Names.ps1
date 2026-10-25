# Names — Represents a collection of all the objects in the spreadsheet.
class Names : LinkElement {
    # This class property is tagged as an XML element named "count" and stores an integer value.
    [Nullable[int32]]$Count
    [LinkElement[]]$NameList
}
