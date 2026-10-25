# Validations — Represents data validation collection.
class Validations : LinkElement {
    # Property summary: The property "Count" with an XML element name "count" returns the number of items in the "ValidationList".
    [Nullable[int32]]$Count
    [LinkElement[]]$ValidationList
}
