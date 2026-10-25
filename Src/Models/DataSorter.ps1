# DataSorter — Summary description for DataSorter.
class DataSorter {
    # Gets and sets whether case sensitive when comparing string.
    [Nullable[bool]]$CaseSensitive
    # Represents whether the range has headers.
    [Nullable[bool]]$HasHeaders
    # Gets the key list of data sorter.
    [SortKey[]]$KeyList
    # True means that sorting orientation is from left to right. False means that sorting orientation is from top to bottom. The default value is false.
    [Nullable[bool]]$SortLeftToRight
    # Indicates whether sorting anything that looks like a number.
    [Nullable[bool]]$SortAsNumber
    # Gets the key list of data sorter.
    [DataSorterKey[]]$Keys
}
