# DecomposeUserTaskRequest — AI task decomposition: Convert user objectives to sequential action plans with formatted file export.
class DecomposeUserTaskRequest : RequestOption {
    [string]$TaskDescription

    [string]$Region
    [string]$Password

    DecomposeUserTaskRequest([string]$TaskDescription) {
        if ([string]::IsNullOrEmpty($TaskDescription)) { throw [System.ArgumentException]::new('TaskDescription is required') }
        $this.TaskDescription = $TaskDescription
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/ai/task/decompose'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $this.TaskDescription
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
