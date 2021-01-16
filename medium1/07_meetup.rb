=begin
Typically meetups happen on the same day of the week.

Examples are

    the first Monday
    the third Tuesday
    the Wednesteenth
    the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a 
meetup whose members realised that there are exactly 7 days that end in 
'-teenth'. Therefore, one is guaranteed that each day of the week (Monday, 
Tuesday, ...) will have exactly one date that is named with '-teenth' in 
every month.

Write code that calculates date of meetups.
=end

=begin
- Problem: (input/output/Rules/Questions)
  - input: day of week, the particular schedule
  - output: the particular day of the month for the meetup

- Examples (test cases)

- Data Structure

- Algorithm (mental model)
  - create an object initialized with month and year.
  - provide a day of the week and 'schedule' criteria that will figure out the particular day of the month schedule criteria corresponds with 
    ex: month 5, year 2013, monday, teenth
       will return the 13th of the month
  - figure out what day of month fits the criteria of the given day of the week and the given schedule

  - create a hash of start month dates for schedule
    first = 1
    second = 8
    ...
  
  - retrieve the calendar day of the schedule passed in, set to start_date
  - 

- Code (Implement a solution)

=end
require 'date'
class Meetup
  WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday , :friday, :saturday]

  START_DATE = {
    :first => 1,
    :second => 8,
    :third => 15,
    :fourth => 22,
    :last => -7,
    :teenth => 13
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.civil(@year, @month, START_DATE[schedule])
    result = nil
    
    0.upto(6).each do |num|
      if (date + num).wday == WEEKDAYS.index(weekday)
        result = (date + num)
      end
    end
    result
  end
end
