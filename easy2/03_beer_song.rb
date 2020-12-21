=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song. 
See the test suite for the entire son
=end


class BeerSong
  def verse(num_of_bottles)
    case num_of_bottles
    when (3..99) then multi_bottles_verse(num_of_bottles)
    when 2       then two_bottles_verse(num_of_bottles)
    when 1       then one_bottle_verse(num_of_bottles)
    when 0       then zero_bottles_verse
    end
  end

  def multi_bottles_verse(num_of_bottles)
    "#{num_of_bottles} bottles of beer on the wall, #{num_of_bottles} bottles of beer.\n" \
    "Take one down and pass it around,  #{num_of_bottles -1} bottles of beer on the wall.\n"
  end

  def two_bottles_verse(num_of_bottles)
    "#{num_of_bottles} bottles of beer on the wall, #{num_of_bottles} bottles of beer.\n" \
    "Take one down and pass it around,  #{num_of_bottles -1} bottle of beer on the wall.\n"
  end

  def one_bottle_verse(num_of_bottles)
    "#{num_of_bottles} bottle of beer on the wall, #{num_of_bottles} bottle of beer.\n" \
    "Take it down and pass it around,  no more bottles of beer on the wall.\n"
  end

  def zero_bottles_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verses(start_bottle, stop_bottle)
   
    lyrics = start_bottle.downto(stop_bottle).map do |bottles|
      verse(bottles)
    end
    lyrics.join("\n")
  end
end

puts BeerSong.new.verses(2, 0)