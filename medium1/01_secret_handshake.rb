=begin
Write a program that will take a decimal number, and convert it to 
the appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand 
binary, and those who don't. You and your fellow cohort of those 
in the "know" when it comes to binary decide to come up with a 
secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret 
handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

The program should consider strings specifying an invalid binary 
as the value 0.
=end


class SecretHandshake
  
  def initialize(input)
    @binary_string = input.to_i.to_s(2)
  end

  def commands
    code_words = []
    
    @binary_string.reverse.each_char.with_index do |char, index|
      case
      when char == "1" && index == 0 then code_words << "wink"
      when char == "1" && index == 1 then code_words << "double blink"
      when char == "1" && index == 2 then code_words << "close your eyes"
      when char == "1" && index == 3 then code_words << "jump"
      end
    end
    @binary_string.size == 5 ? code_words.reverse : code_words
  end
end

