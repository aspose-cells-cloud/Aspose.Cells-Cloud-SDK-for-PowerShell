# PostWorkbookSplitRequest — Split the workbook with a specific format.
class PostWorkbookSplitRequest : RequestOption {
    [string]$Name

    [string]$Format
    [string]$OutFolder
    [Nullable[int32]]$From
    [Nullable[int32]]$To
    [Nullable[int32]]$HorizontalResolution
    [Nullable[int32]]$VerticalResolution
    [string]$SplitNameRule
    [string]$Folder
    [string]$StorageName
    [string]$OutStorageName

    PostWorkbookSplitRequest([string]$name) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        $this.Name = $name
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/split'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Format)) { $q['format'] = $this.Format }
        if (-not [string]::IsNullOrEmpty($this.OutFolder)) { $q['outFolder'] = $this.OutFolder }
        if ($null -ne $this.From) { $q['from'] = $this.From }
        if ($null -ne $this.To) { $q['to'] = $this.To }
        if ($null -ne $this.HorizontalResolution) { $q['horizontalResolution'] = $this.HorizontalResolution }
        if ($null -ne $this.VerticalResolution) { $q['verticalResolution'] = $this.VerticalResolution }
        if (-not [string]::IsNullOrEmpty($this.SplitNameRule)) { $q['splitNameRule'] = $this.SplitNameRule }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
