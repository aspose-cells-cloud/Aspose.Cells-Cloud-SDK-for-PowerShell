# ConditionalFormattings — Encapsulates a collection of objects.
class ConditionalFormattings : LinkElement {
    # The property "Count" is decorated with [XmlElement("count")] attribute for XML serialization.
    [Nullable[int32]]$Count
    [ConditionalFormatting[]]$ConditionalFormattingList
}
