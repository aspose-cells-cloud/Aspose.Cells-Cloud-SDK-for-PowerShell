# AboveAverage — Describe the AboveAverage conditional formatting rule. This conditional formatting rule highlights cells that are above or below the average for all values in the range.
class AboveAverage {
    # Get or set the flag indicating whether the rule is an "above average" rule. 'true' indicates 'above average'. Default value is true.
    [Nullable[bool]]$IsAboveAverage
    # Get or set the flag indicating whether the 'aboveAverage' and 'belowAverage' criteria is inclusive of the average itself, or exclusive of that value. 'true' indicates to include the average value in the criteria. Default value is false.
    [Nullable[bool]]$IsEqualAverage
    # Get or set the number of standard deviations to include above or below the average in the conditional formatting rule. The input value must between 0 and 3 (include 0 and 3). Setting this value to 0 means stdDev is not set. The default value is 0.
    [Nullable[int32]]$StdDev
}
