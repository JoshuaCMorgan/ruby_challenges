=begin
Implement octal to decimal conversion. Given an octal input string, your
program should produce a decimal output.

Note:

Implement the conversion yourself. Do not use something else to perform the
conversion for you. Treat invalid input as octal 0.
=end
=begin
  - if string contains an alphabet letter or alphanumeric number 8 or 9, return 0
=end

class Octal
  BASE = 8
  INVALID_OCTAL = (/\D|[8-9]/).freeze

  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    octal_string =~ INVALID_OCTAL ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index)
    end
    decimal
  end
end
