=begin
Write a program that will take a string of digits and give you all the 
possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234

And the following 4-digit series:

- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve 
whatever you get.
=end

=begin
Problem/Rules (To do/To Find - Knowns/Unknowns)
  - string of digits
  - number series that is
    - consecutive "123" "456" "234"
    - any given length up to 5
  - return integer

Mental Model/Approach
  - depending on the integer given, convert to integer and divide numbers into consecutive units of given size

Algorithm
  - convert string to collection of numbers
    - iterate through each character
      - transform to integer
      - map to collection
  - Using colection, create series of consecutive numbers of a given size
    - iterate through each number 
      - collect consecutive numbers of given size
      - push to new array
=end


class Series
  attr_reader :string_digit

  def initialize(string_digit)
    @string_digit = string_digit
  end

  def slices(length)
    raise ArgumentError, "length too long" if length > string_digit.size
    digits = string_digit.each_char.map(&:to_i)
    digits.each_cons(length).to_a
  end
end

