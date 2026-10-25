# PivotTables — Represents the collection of all the PivotTable objects on the specified worksheet.
class PivotTables : LinkElement {
    # Xml property "PivotTableList" of the class contains a list of "LinkElement" objects with the element name "PivotTable".
    [LinkElement[]]$PivotTableList
}
