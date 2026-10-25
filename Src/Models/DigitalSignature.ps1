# DigitalSignature — Signature in file.
class DigitalSignature {
    # The purpose to signature.
    [string]$Comments
    # The time when the document was signed.
    [string]$SignTime
    # Specifies a GUID which can be cross-referenced with the GUID of the signature line stored in the document content. Default value is Empty (all zeroes) Guid.
    [string]$Id
    # Specifies the text of actual signature in the digital signature. Default value is Empty.
    [string]$Password
    # Specifies an image for the digital signature. Default value is null.
    [byte[][]]$Image
    # Specifies the class ID of the signature provider. Default value is Empty (all zeroes) Guid.
    [string]$ProviderId
    # If this digital signature is valid and the document has not been tampered with, this value will be true.
    [Nullable[bool]]$IsValid
    # XAdES type. Default value is None(XAdES is off).
    [string]$XAdESType
}
