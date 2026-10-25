# Comment — Encapsulates the object that represents a cell comment.
class Comment : LinkElement {
    # Property: CellName attribute with XmlElement tag in the class.
    [string]$CellName
    # Gets and sets Name of the original comment author
    [string]$Author
    # Gets and sets the html string which contains data and some formats in this comment.
    [string]$HtmlNote
    # Represents the content of comment.
    [string]$Note
    # Indicates if size of comment is adjusted automatically according to its content.
    [Nullable[bool]]$AutoSize
    # Represents if the comment is visible or not.
    [Nullable[bool]]$IsVisible
    # Represents the width of the comment, in unit of pixels.
    [Nullable[int32]]$Width
    # Represents the Height of the comment, in unit of pixels.
    [Nullable[int32]]$Height
    # Gets and sets the text horizontal alignment type of the comment.
    [string]$TextHorizontalAlignment
    # Gets and sets the text orientation type of the comment.
    [string]$TextOrientationType
    # Gets and sets the text vertical alignment type of the comment.
    [string]$TextVerticalAlignment
}
