# ImportXMLRequest — Indicates import xml data request
class ImportXMLRequest {
    # XML file source
    [DataSource]$XMLFileSource
    # Import position description.
    [ImportPosition]$ImportPosition
    # Base64String default is null
    [string]$XMLContent
}
