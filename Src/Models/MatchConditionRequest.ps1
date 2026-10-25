# MatchConditionRequest — Indicates the match condition that needs to be processed for the file name.
class MatchConditionRequest {
    # Regex Pattern.
    [string]$RegexPattern
    # Name list.
    [string[]]$FullMatchConditions
}
