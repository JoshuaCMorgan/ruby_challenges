
class ZeroVerses
  def verse(_count)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneVerse
  def verse(_count)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoVerses
  def verse(_count)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class RegularVerses
  def verse(count)
    "#{count} bottles of beer on the wall, #{count} bottles of beer.\n" \
    "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong

  # Lookup table
  # if bottle_count is greater than 2, then returns RegularVerses
  VERSE_CLASSES = Hash.new(RegularVerses).merge({
    0 => ZeroVerses,
    1 => OneVerse,
    2 => TwoVerses
  })

  def verse(bottle_count)
    # identify proper recipient of given verse based on bottle_count
    # retrieve from recipient(class) the proper verse string
    VERSE_CLASSES[bottle_count].new.verse(bottle_count)
  end

  def verses(start_count, stop_count)
    lyrics = start_count.downto(stop_count).map do |bottle_count|
      verse(bottle_count)
    end
    lyrics.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end