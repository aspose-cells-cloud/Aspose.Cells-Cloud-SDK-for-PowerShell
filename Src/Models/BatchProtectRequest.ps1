# BatchProtectRequest — Indicates batch protect file request
class BatchProtectRequest {
    # The directory stores files that need to format conversion.
    [string]$SourceFolder
    # Aspose Cloud storage name
    [string]$SourceStorage
    # Indicates the match condition that needs to be processed for the file name.
    [MatchConditionRequest]$MatchCondition
    # This property defines the protection type of an object.
    [string]$ProtectionType
    [string]$Password
    # The directory that stores files whose format conversion was successful.
    [string]$OutFolder
    # Aspose Cloud storage name.
    [string]$OutStorage
}
