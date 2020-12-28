=begin
Pig Latin is a made-up children's language that's intended to be 
confusing. It obeys a few simple rules (below), but when it's spoken 
quickly it's really difficult for non-children (and non-native speakers) 
to understand.

    Rule 1: If a word begins with a vowel sound, add an "ay" sound to the 
    end of the word.
    Rule 2: If a word begins with a consonant sound, move it to the end of 
    the word, and then add an "ay" sound to the end of the word.

There are a few more rules for edge cases, and there are regional variants too.
=end

=begin
- Problem: (input/output/Rules/Questions)
  - input: string
  -output: word in pig latin
- Examples (test cases)

- Data Structure

- Algorithm (mental model)
  - if begins with vowel, add 'ay' to word
  - if begins with consonant

- Code (Implement a solution)

=end

class PigLatin
  def self.translate(string)
    string.split(/ /).map do |word|
      transform_word(word)
    end
  end

  def self.transform_word(word)
    if word_begins_with_vowel_sound?(word)
      word + 'ay'
    else 
      consonant_sound, rest_of_word = parse_for_consonants(word)
      rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.word_begins_with_vowel?(word)
    word.match(/\A[aeiou]|\A[xy][^aeiou]/)
  end

  def self.parse_for_consonants(word)
    consonant_split = /(\A[^aeiou]+|[^aeiou]*qu)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end