# WordCaseOptions — I'm here to assist you. Please provide the features you would like me to summarize for the class.
class WordCaseOptions {
    # Represents data source. There are three types of data, they are CloudFileSystem, RequestFiles, HttpUri.
    [DataSource]$DataSource
    # Represents file information. Include of filename, filesize, and file content(base64String).
    [FileInfo]$FileInfo
    [string]$WordCaseType
    [ScopeOptions]$ScopeOptions
}
