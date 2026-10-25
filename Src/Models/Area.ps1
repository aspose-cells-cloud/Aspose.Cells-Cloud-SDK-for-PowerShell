# Area — Encapsulates the object that represents an area format.
class Area {
    # Gets or sets the background of the .
    [Color]$BackgroundColor
    # Represents a object that contains fill formatting properties for the specified chart or shape.
    [FillFormat]$FillFormat
    # Gets or sets the foreground .
    [Color]$ForegroundColor
    # This class has a property named "Format" of type string with both getter and setter methods.
    [string]$Format
    # If the property is true and the value of chart point is a negative number, the foreground color and background color will be exchanged.
    [Nullable[bool]]$InvertIfNegative
    # Returns or sets the degree of transparency of the area as a value from 0.0 (opaque) through 1.0 (clear).
    [Nullable[double]]$Transparency
}
