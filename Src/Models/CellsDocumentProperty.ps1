# CellsDocumentProperty — Cells document property.
class CellsDocumentProperty {
    # Returns the name of the property.
    [string]$Name
    # Gets or sets the value of the property.
    [string]$Value
    # Indicates whether this property is linked to content
    [string]$IsLinkedToContent
    # The linked content source.
    [string]$Source
    # Gets the data type of the property.
    [string]$Type
    # Returns true if this property does not have a name in the OLE2 storage and a unique name was generated only for the public API.
    [string]$IsGeneratedName
}
