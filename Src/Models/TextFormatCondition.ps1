# TextFormatCondition — Represents text format condition.
class TextFormatCondition : FormulaFormatCondition {
    # The text value in a "text contains" conditional formatting rule. Valid only for type = containsText, notContainsText, beginsWith and endsWith. The default value is null.
    [string]$Text
}
