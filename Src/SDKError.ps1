# SDKError — the exception every SDK failure throws.
# Mirrors the Go SDK's errors.go SDKError type.
class SDKError : System.Exception {
    [int]$Code
    [string]$Message

    SDKError([int]$code, [string]$message) : base($message) {
        $this.Code    = $code
        $this.Message = $message
    }

    SDKError([int]$code, [string]$message, [Exception]$inner) : base($message, $inner) {
        $this.Code    = $code
        $this.Message = $message
    }
}
