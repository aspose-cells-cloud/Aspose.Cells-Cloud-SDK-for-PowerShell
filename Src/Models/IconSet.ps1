# IconSet — Describe the IconSet conditional formatting rule. This conditional formatting rule applies icons to cells according to their values.
class IconSet {
    # Get the from the collection
    [ConditionalFormattingIcon[]]$CfIcons
    # Get the CFValueObjects instance.
    [ConditionalFormattingValue[]]$Cfvos
    # Indicates whether the icon set is custom. Default value is false.
    [Nullable[bool]]$IsCustom
    # Get or set the flag indicating whether to reverses the default order of the icons in this icon set. Default value is false.
    [Nullable[bool]]$Reverse
    # Get or set the flag indicating whether to show the values of the cells on which this icon set is applied. Default value is true.
    [Nullable[bool]]$ShowValue
    # Get or Set the icon set type to display. Setting the type will auto check if the current Cfvos's count is accord with the new type. If not accord, old Cfvos will be cleaned and default Cfvos will be added.
    [string]$IconSetType
}
