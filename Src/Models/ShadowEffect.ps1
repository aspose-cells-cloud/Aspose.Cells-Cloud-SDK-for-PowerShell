# ShadowEffect — This class specifies the shadow effect of the chart element or shape.
class ShadowEffect {
    # Gets and sets the lighting angle. Range from 0 to 359.9 degrees.
    [Nullable[double]]$Angle
    # Gets and sets the blur of the shadow. Range from 0 to 100 points.
    [Nullable[double]]$Blur
    # Gets and sets the color of the shadow.
    [CellsColor]$Color
    # Gets and sets the distance of the shadow. Range from 0 to 200 points.
    [Nullable[double]]$Distance
    # Gets and sets the preset shadow type of the shadow.
    [string]$PresetType
    # Gets and sets the size of the shadow. Range from 0 to 2.0. Meaningless in inner shadow.
    [Nullable[double]]$Size
    # Gets and sets the degree of transparency of the shadow. Range from 0.0 (opaque) to 1.0 (clear).
    [Nullable[double]]$Transparency
}
