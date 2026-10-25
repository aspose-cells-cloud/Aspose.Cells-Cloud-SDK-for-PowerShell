# ImportOption — Class Summary: This class covers the features of artificial intelligence, machine learning, deep learning, and natural language processing.
class ImportOption {
    # Destination worksheet name.
    [string]$DestinationWorksheet
    # A boolean property `IsInsert` that can be both read and written.
    [Nullable[bool]]$IsInsert
    [string]$ImportDataType
    [DataSource]$DataSource
    [FileSource]$Source
}
