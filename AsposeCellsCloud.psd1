@{
    RootModule           = 'AsposeCellsCloud.psm1'
    ModuleVersion        = '26.10.5'
    GUID                 = 'd2e2b5e8-5f6a-4a1b-9c3d-7e8f9a0b1c2d'
    Author               = 'Aspose'
    CompanyName          = 'Aspose'
    Copyright            = '(c) 2026 Aspose.Cells Cloud. All rights reserved.'
    Description          = 'Aspose.Cells Cloud SDK for PowerShell — create, edit, convert, merge, split, protect and process Excel/XLSX documents in cloud storage.'
    PowerShellVersion    = '7.0'

    FunctionsToExport    = @(
        'ConvertTo-AsposeJson'
        'ConvertTo-AsposeHashtable'
        'ConvertTo-AsposeQueryString'
    )
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @()

    PrivateData          = @{
        PSData = @{
            Tags        = @('Aspose', 'Cells', 'Excel', 'XLSX', 'Cloud', 'SDK')
            ProjectUri  = 'https://products.aspose.cloud/cells/'
            LicenseUri  = 'https://github.com/aspose-cells-cloud/aspose-cells-cloud-powershell/blob/master/LICENSE'
            ReleaseNotes = 'See CHANGELOG.md for 26.10.5: 472 operations across 43 controllers (spec 26.10.5), corrected AggregateCellsByColor route, GET search verbs, SmartMarkerTemplate file inputs, SharedDriveInfo model, binary-response fix, examples/.'
        }
    }
}
