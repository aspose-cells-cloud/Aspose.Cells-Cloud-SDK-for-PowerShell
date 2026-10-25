# DataTransformationRequest — Data Transformation Request
class DataTransformationRequest {
    # Indicates the source of the mount data.
    [FileInfo]$FileInfo
    # Indicates the source of the mount data.
    [DataSource]$DataSource
    # Indicates load data.
    [LoadData]$LoadData
    # Indicates applied step list.
    [AppliedStep[]]$AppliedSteps
    # This class has a property named "Region" of type string with both a getter and a setter.
    [string]$Region
    # Indicates output format
    [string]$OutFormat
}
