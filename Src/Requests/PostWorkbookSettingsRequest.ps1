# PostWorkbookSettingsRequest — Update setting in the workbook.
class PostWorkbookSettingsRequest : RequestOption {
    [string]$Name
    [WorkbookSettings]$Settings

    [string]$Folder
    [string]$StorageName

    PostWorkbookSettingsRequest([string]$name, [WorkbookSettings]$settings) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $settings) { throw [System.ArgumentException]::new('settings is required') }
        $this.Name = $name
        $this.Settings = $settings
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/settings'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Settings
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
