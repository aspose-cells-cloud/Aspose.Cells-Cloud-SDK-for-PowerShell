# WorkbookEncryptionRequest — Used by workbook encryption/decryption requests.
class WorkbookEncryptionRequest {
    # Workbook encription type.
    [string]$EncryptionType
    # Encription key length.
    [Nullable[int32]]$KeyLength
    # Encription password.
    [string]$Password
}
