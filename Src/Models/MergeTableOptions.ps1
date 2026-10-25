# MergeTableOptions
class MergeTableOptions {
    [CombinationSourceData]$MainTable
    [CombinationSourceData]$SecondaryTable
    [string]$DataMergeType
    [Nullable[bool]]$OverwriteMainTable
    [Nullable[bool]]$SyncDataToTargetWorkbook
    [DataOutputLocation]$MergedDataToPosition
}
