=begin
The Romans were a clever bunch. They conquered most of Europe and ruled it for 
hundreds of years. They invented concrete and straight roads and even bikinis. 
One thing they never discovered though was the number zero. This made writing 
and dating extensive histories of their exploits slightly more challenging, but 
the system of numbers they came up with is still in use today. For example the 
BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these 
letters have lots of straight lines and are hence easy to hack into stone
tablets).

 1  => I
10  => X
 7  => VII

There is no need to be able to convert numbers larger than about 3000. (The 
  Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit 
separately starting with the left most digit and skipping any digit with a 
value of zero.

To see this in practice, consider the example of 1990. In Roman numerals 1990 
is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

See also: http://www.novaroma.org/via_romana/numbers.html
=end

=begin
  1451
  

=end

class Integer
  ROMAN_NUMERAL_RULES = {
    1000 => "M",
    900 =>  "CM",
    500 =>  "D",
    400 =>  "CD",
    100 =>  "C",
    90  =>  "XC",
    50  =>  "L",
    40  =>  "XL",
    10  =>  "X",
    9   =>  "IX",
    5   =>  "V",
    4   =>  "IV",
    1   =>  "I",
  }

  def to_roman
    number = self
    roman_numeral = ''
    ROMAN_NUMERAL_RULES.keys.each do |value|
      num_of_roman_letters, number = number.divmod(value)
      roman_numeral += ROMAN_NUMERAL_RULES[value] * num_of_roman_letters
    end

    roman_numeral
  end
end

## without divmod
  def to_roman
    number = self
    roman_numeral = ''

    ROMAN_NUMERAL_RULES.each do |value, roman_number|
      number_of_roman_letters = number / value 
      roman_numeral += roman_number * number_of_roman_letters 
      number -= number_of_roman_letters * value
    end
    roman_numeral
  end
end

p 1024.to_roman