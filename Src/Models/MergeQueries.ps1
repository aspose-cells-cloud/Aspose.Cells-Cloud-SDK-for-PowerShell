# MergeQueries — Represents merge quesies.
class MergeQueries {
    # Indicates the name of the data query , it is matched in the data query set.
    [string]$DataQueryNameA
    # Represents index field of DataA.
    [string]$DataAIndexField
    # Indicates the name of the data query , it is matched in the data query set.
    [string]$DataQueryNameB
    # Represents index field of DataB.
    [string]$DataBIndexField
    # Represents ethods of data consolidation.
    [string]$JoinType
    [string]$AppliedOperateType
}
