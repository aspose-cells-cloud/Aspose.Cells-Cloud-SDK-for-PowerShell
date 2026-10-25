# ImportJsonRequest — Indicates import xml data request
class ImportJsonRequest {
    # Json file source
    [DataSource]$JsonFileSource
    # Import position description.
    [ImportPosition]$ImportPosition
    # Base64String default is null
    [string]$JsonContent
}
