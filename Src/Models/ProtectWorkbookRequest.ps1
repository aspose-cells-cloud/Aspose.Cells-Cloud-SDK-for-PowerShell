# ProtectWorkbookRequest — Indicates protect workbook request
class ProtectWorkbookRequest {
    # Indicates aways open read-only.
    [Nullable[bool]]$AwaysOpenReadOnly
    # Indicates encrypt with password.
    [string]$EncryptWithPassword
    # Represents the various types of protection options available for a worksheet.
    [Protection]$ProtectCurrentSheet
    # Represents the various types of protection options available for all worksheets.
    [Protection]$ProtectAllSheets
    # Indicates protect workbook structure. All, Contents, Objects, Scenarios, Structure, Windows, and None.
    [string]$ProtectWorkbookStructure
    # Indicates signature in file.
    [DigitalSignature]$DigitalSignature
    # Indicates mark as final.
    [Nullable[bool]]$MarkAsFinal
}
