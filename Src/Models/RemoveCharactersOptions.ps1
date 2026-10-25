# RemoveCharactersOptions — Class summary: The class features discussing effective communication strategies, developing problem-solving skills, and increasing self-awareness for personal growth.
class RemoveCharactersOptions {
    # Name property with a getter and setter override that returns a string.
    [string]$Name
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    # Specifies the range of cells within the worksheet where the spreadsheet operations will be performed. This parameter allows users to define the exact area to be processed, ensuring that operations are applied only to the designated cells.
    [ScopeOptions]$ScopeOptions
    [RemoveCharactersByCharacter]$RemoveCharactersByCharacter
    [RemoveCharactersByPosition]$RemoveCharactersByPosition
}
