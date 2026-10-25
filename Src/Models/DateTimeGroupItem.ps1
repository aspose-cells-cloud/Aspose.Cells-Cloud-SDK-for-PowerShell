# DateTimeGroupItem — Represents the datetime's group setting.
class DateTimeGroupItem {
    # Gets and sets the group type.
    [string]$DateTimeGroupingType
    # Gets and sets the day of the grouped date time.
    [Nullable[int32]]$Day
    # Gets and sets the hour of the grouped date time.
    [Nullable[int32]]$Hour
    # Gets and sets the minute of the grouped date time.
    [Nullable[int32]]$Minute
    # Gets and sets the month of the grouped date time.
    [Nullable[int32]]$Month
    # Gets and sets the second of the grouped date time.
    [Nullable[int32]]$Second
    # Gets and sets the year of the grouped date time.
    [Nullable[int32]]$Year
}
