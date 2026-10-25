# PdfSecurityOptions
class PdfSecurityOptions {
    [Nullable[bool]]$AnnotationsPermission
    [Nullable[bool]]$AssembleDocumentPermission
    [Nullable[bool]]$ExtractContentPermission
    [Nullable[bool]]$FillFormsPermission
    [Nullable[bool]]$FullQualityPrintPermission
    [Nullable[bool]]$ModifyDocumentPermission
    [string]$OwnerPassword
    [Nullable[bool]]$PrintPermission
    [string]$UserPassword
}
