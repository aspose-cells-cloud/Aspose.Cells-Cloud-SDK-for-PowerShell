# WorkbookProtectionRequest — Used by workbook protection requests.
class WorkbookProtectionRequest {
    # Protection type. Can be ALL, CONTENTS, NONE, OBJECTS, SCENARIOS, STRUCTURE, WINDOWS
    [string]$ProtectionType
    # Encription password.
    [string]$Password
}
