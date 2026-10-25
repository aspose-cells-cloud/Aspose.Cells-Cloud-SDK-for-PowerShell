# AsposeCellsCloudClient — core SDK client that authenticates and executes requests.
# Mirrors the Go SDK's client.go CellsCloudClient type.
class AsposeCellsCloudClient {
    [Configuration]$Configuration
    [int]$Timeout
    [int]$Retries

    AsposeCellsCloudClient([string]$clientId, [string]$clientSecret, [string]$baseURL) {
        $this.Configuration = [Configuration]::new($clientId, $clientSecret, $baseURL, 'v4.0')
        $this.Timeout       = 30
        $this.Retries       = 0
    }

    # Acquire an OAuth2 client-credentials access token. A still-valid token is
    # reused (the cloud issues ~1h tokens), so a token is only fetched when it
    # has not been acquired yet or has expired — instead of on every request.
    # Failures are surfaced as SDKError so every SDK error is the same type.
    [void] RequestOauthToken() {
        $now = [DateTime]::Now
        if (-not [string]::IsNullOrEmpty($this.Configuration.AccessToken) -and
            $this.Configuration.GetAccessTokenTime.HasValue -and
            ($now - $this.Configuration.GetAccessTokenTime.Value).TotalSeconds -lt 3600) {
            return
        }

        $tokenUrl = $this.Configuration.BasePath + '/v3.0/cells/connect/token'
        $body = @{
            grant_type    = 'client_credentials'
            client_id     = $this.Configuration.ClientId
            client_secret = $this.Configuration.ClientSecret
        }
        try {
            $resp = Invoke-RestMethod -Uri $tokenUrl -Method Post -Body $body
        }
        catch {
            throw [SDKError]::new(0, "OAuth token request failed: $($_.Exception.Message)", $_.Exception)
        }
        $this.Configuration.AccessToken        = $resp.access_token
        $this.Configuration.GetAccessTokenTime = [DateTime]::Now
    }

    # Execute a single request and return the unified response.
    [RichResponse] Do([RequestOption]$request) {
        return $this.ExecuteOnce($request)
    }

    # Build and execute one HTTP request, retrying transient failures.
    #
    # Error semantics (mirroring the Go SDK's error return):
    #   - a 2xx response is returned as a RichResponse;
    #   - any other HTTP status throws an SDKError carrying the status code and the
    #     response body as the message;
    #   - transport-level failures (timeout, connection refused, ...) throw an SDKError
    #     with Code 0 after retries are exhausted.
    #
    # Retry is gated by $this.Retries (default 0 = no retry) and applies only to
    # transient failures: transport exceptions and HTTP 408/429/5xx. A 4xx client
    # error (e.g. 400) is never retried and fails fast.
    [RichResponse] ExecuteOnce([RequestOption]$request) {
        # 1. Build the full URL (base path + versioned path).
        $url = $this.Configuration.BasePath + $request.GetPath()

        # 2. Append query parameters.
        $query = $request.GetQueryParameters()
        if ($null -ne $query -and $query.Count -gt 0) {
            $pairs = [System.Collections.Generic.List[string]]::new()
            foreach ($key in $query.Keys) {
                $val = ConvertTo-AsposeQueryString -Value $query[$key]
                $pairs.Add(('{0}={1}' -f [Uri]::EscapeDataString([string]$key), [Uri]::EscapeDataString($val)))
            }
            if ($pairs.Count -gt 0) {
                $sep = if ($url.Contains('?')) { '&' } else { '?' }
                $url = $url + $sep + ($pairs -join '&')
            }
        }

        # 3. Assemble headers (defaults + auth + client metadata). The token is
        #    acquired once here, outside the retry loop, and reused across attempts.
        $headers = @{}
        foreach ($key in $this.Configuration.DefaultHeader.Keys) {
            $headers[$key] = $this.Configuration.DefaultHeader[$key]
        }
        $headers['x-aspose-client']         = 'powershell sdk'
        $headers['x-aspose-client-version'] = $this.Configuration.Version
        $this.RequestOauthToken()
        $headers['Authorization'] = 'Bearer ' + $this.Configuration.AccessToken

        # 4. Build the request body (JSON, multipart, or both).
        $method      = $request.GetMethod()
        $jsonBody    = $request.GetJsonBody()
        $form        = $request.GetMultipartForm()
        $hasJson     = $null -ne $jsonBody
        $hasForm     = $null -ne $form -and $form.Count -gt 0

        $params = @{
            Uri        = $url
            Method     = $method
            Headers    = $headers
            TimeoutSec = $this.Timeout
        }

        if ($hasForm) {
            $formBody = @{}
            foreach ($key in $form.Keys) {
                $val = $form[$key]
                if ($key -is [string] -and $key.StartsWith('@')) {
                    # File upload: the '@' prefix marks a local file path.
                    $formBody[$key.Substring(1)] = Get-Item -LiteralPath ([string]$val)
                }
                else {
                    $formBody[$key] = $val
                }
            }
            if ($hasJson) {
                # Agreement with the Go SDK: the JSON body rides along as a text field.
                $formBody['request_body_data'] = ConvertTo-AsposeJson -InputObject $jsonBody
            }
            $params['Form'] = $formBody
        }
        elseif ($hasJson) {
            $params['Body']        = ConvertTo-AsposeJson -InputObject $jsonBody
            $params['ContentType'] = 'application/json'
        }

        # 5. Execute with optional retry.
        $attempts = [Math]::Max(1, $this.Retries + 1)
        for ($attempt = 1; $attempt -le $attempts; $attempt++) {
            try {
                $resp = Invoke-WebRequest @params -SkipHttpErrorCheck
            }
            catch {
                # Transport-level failure (timeout, DNS, connection refused, ...).
                if ($attempt -lt $attempts) {
                    Start-Sleep -Milliseconds ([int](250 * [Math]::Pow(2, $attempt - 1)))
                    continue
                }
                throw [SDKError]::new(0, $_.Exception.Message, $_.Exception)
            }

            $status     = [int]$resp.StatusCode
            $retryable  = $status -eq 408 -or $status -eq 429 -or $status -ge 500
            if ($retryable -and $attempt -lt $attempts) {
                Start-Sleep -Milliseconds ([int](250 * [Math]::Pow(2, $attempt - 1)))
                continue
            }

            $headerTable = @{}
            foreach ($key in $resp.Headers.Keys) {
                $headerTable[$key] = $resp.Headers[$key]
            }

            $bodyBytes = $null
            if ($null -ne $resp.Content) {
                $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes([string]$resp.Content)
            }

            # Non-2xx after retries are exhausted: throw, carrying the status and body.
            if ($status -ge 300) {
                $body = ''
                if ($null -ne $bodyBytes -and $bodyBytes.Length -gt 0) {
                    $body = [System.Text.Encoding]::UTF8.GetString($bodyBytes)
                }
                throw [SDKError]::new($status, "HTTP ${status}: $body")
            }

            return [RichResponse]::new($status, $headerTable, $bodyBytes)
        }

        # Unreachable: the loop always returns or throws.
        throw [SDKError]::new(0, 'Request failed after exhausting all attempts.')
    }
}
