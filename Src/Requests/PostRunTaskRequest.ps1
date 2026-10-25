# PostRunTaskRequest — Run tasks.
class PostRunTaskRequest : RequestOption {
    [TaskData]$TaskData

    PostRunTaskRequest([TaskData]$TaskData) {
        if ($null -eq $TaskData) { throw [System.ArgumentException]::new('TaskData is required') }
        $this.TaskData = $TaskData
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/task/runtask'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $this.TaskData
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
