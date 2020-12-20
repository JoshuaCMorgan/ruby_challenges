=begin
Write a program that will convert a trinary number, represented as a string 
(e.g. '102012'), to its decimal equivalent using first principles (without 
  using an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid 
trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is 
the 3's place, the third to last is the 9's place, etc.
=end

class Trinary
  BASE = 3
  INVALID_TRINARY = (/\D|[3-9]/).freeze

  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string = trinary_string =~ INVALID_TRINARY ? '0' : trinary_string
  end

  def to_decimal
    decimal = 0
    trinary_string.reverse.each_char.with_index do |char, idx|
      decimal += char.to_i * (BASE ** idx)
    end
    decimal
  end
end

p Trinary.new('9').to_decimal

