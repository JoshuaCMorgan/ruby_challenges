=begin
Write a program that given a phrase can count the occurrences of 
each word in that phrase.

For example, if we count the words for the input "olly olly in 
come free", we should get:

olly: 2
in: 1
come: 1
free: 1

=end
=begin
  - split by empty space and comma and put each in array collection
  - select only those of collection that are alpha/numeric characters
  - remove from each word
    - all but alpha/numeric characters, single quote inside word
    - single quotes at beginning and single quote at end of string
=end
class Phrase
  def initialize(phrase)
    @words = phrase.split(/[\s,]/)
                   .select {|word| word.match(/[a-zA-Z0-9]/) }
                   .map { |word| transform_word(word)}
  end

  def word_count
    summary = Hash.new(0)
    @words.each do |word|
      summary[word] += 1
    end
    summary
  end

  def transform_word(word)
    word.gsub(/[^a-zA-Z0-9']/, '')
        .gsub(/^'|'$/, '').downcase
  end
end
