=begin
Write a program that, given a word and a list of possible anagrams, selects the 
correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" 
"google" "inlets" "banana" the program should return a list containing 
"inlets". Please read the test suite for exact rules of anagrams.
=end

class Anagram
  def initialize(original_word)
    @original_word = original_word
  end

  def match(words)
    words.select { |word| anagram?(word, @original_word) }
  end

  private
  

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end

#Challenge: solve this without using ".sort" method

def anagram(word1, word2)
  return false if word1.downcase == word2.downcase
  word_hash(word1) == word_hash(word2)
end

def word_hash(word)
  word_hash = {}
  word.downcase.each_char do |char|
    word_hash[char] ||= 1  
    word_hash[char] += 1
    end
  end
  word_hash
end