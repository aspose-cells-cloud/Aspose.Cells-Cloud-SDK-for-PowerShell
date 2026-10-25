# PageSetup — excel print page setting
class PageSetup {
    # Represents if elements of the document will be printed in black and white.
    [Nullable[bool]]$BlackAndWhite
    # Represents the size of the bottom margin, in unit of centimeters.
    [Nullable[double]]$BottomMargin
    # Represent if the sheet is printed centered horizontally.
    [Nullable[bool]]$CenterHorizontally
    # Represent if the sheet is printed centered vertically.
    [Nullable[bool]]$CenterVertically
    # Represents the first page number that will be used when this sheet is printed.
    [Nullable[int32]]$FirstPageNumber
    # Represents the number of pages tall the worksheet will be scaled to when it's printed. The default value is 1.
    [Nullable[int32]]$FitToPagesTall
    # Represents the number of pages wide the worksheet will be scaled to when it's printed. The default value is 1.
    [Nullable[int32]]$FitToPagesWide
    # Represents the distance from the bottom of the page to the footer, in unit of centimeters.
    [Nullable[double]]$FooterMargin
    # Represents the distance from the top of the page to the header, in unit of centimeters.
    [Nullable[double]]$HeaderMargin
    # Indicates whether the first the page number is automatically assigned.
    [Nullable[bool]]$IsAutoFirstPageNumber
    # Indicates whether header and footer margins are aligned with the page margins. If this property is true, the left header and footer will be aligned with the left margin, and the right header and footer will be aligned with the right margin. This option is enabled by default.
    [Nullable[bool]]$IsHFAlignMargins
    # True means that the header/footer of the first page is different with other pages.
    [Nullable[bool]]$IsHFDiffFirst
    # True means that the header/footer of the odd pages is different with odd pages.
    [Nullable[bool]]$IsHFDiffOddEven
    # Indicates whether header and footer are scaled with document scaling. Only applies for Excel 2007.
    [Nullable[bool]]$IsHFScaleWithDoc
    # If this property is False, the FitToPagesWide and FitToPagesTall properties control how the worksheet is scaled.
    [Nullable[bool]]$IsPercentScale
    # Represents the size of the left margin, in unit of centimeters.
    [Nullable[double]]$LeftMargin
    # Represents the order that Microsoft Excel uses to number pages when printing a large worksheet.
    [string]$Order
    # Represents page print orientation.
    [string]$Orientation
    # Represents the size of the paper.
    [string]$PaperSize
    # Represents the range to be printed.
    [string]$PrintArea
    # Represents the way comments are printed with the sheet.
    [string]$PrintComments
    # Get and sets number of copies to print.
    [Nullable[int32]]$PrintCopies
    # Represents if the sheet will be printed without graphics.
    [Nullable[bool]]$PrintDraft
    # Specifies the type of print error displayed.
    [string]$PrintErrors
    # Represents if cell gridlines are printed on the page.
    [Nullable[bool]]$PrintGridlines
    # Represents if row and column headings are printed with this page.
    [Nullable[bool]]$PrintHeadings
    # Represents the print quality.
    [Nullable[int32]]$PrintQuality
    # Represents the columns that contain the cells to be repeated on the left side of each page.
    [string]$PrintTitleColumns
    # Represents the rows that contain the cells to be repeated at the top of each page.
    [string]$PrintTitleRows
    # Represents the size of the right margin, in unit of centimeters.
    [Nullable[double]]$RightMargin
    # Represents the size of the top margin, in unit of centimeters.
    [Nullable[double]]$TopMargin
    # Represents the scaling factor in percent. It should be between 10 and 400.
    [Nullable[int32]]$Zoom
    # Represents the page header.
    [PageSection[]]$Header
    # Represents the page footor.
    [PageSection[]]$Footer
}
