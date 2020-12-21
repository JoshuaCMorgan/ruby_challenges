=begin
Consider a character set consisting of letters, a space, and a point.  Words
consist of one or more, but at most 20 letters.  An input text consists of one
or more words separated from each other by one or more spaces and terminated by
0 or more spaces followed by a point. Input should be read from, and including,
the first letter of the first word, up to and including the terminating point.
The output text is to be produced such that successive words are separated by a
single space with the last word being terminated by a single point.  Odd words
are copied in reverse order while even words are merely echoed.  For example, 
the input string

"whats the matter with kansas." becomes "whats eht matter htiw kansass"

BONUS POINTS: the characters must be read and printed one at a time
=end

=begin
character set: letters, space, point
  - invalid  inputs? (more than 20, symbols?)
words: 1-20 letters
input: 
  - 1 - * words, 
  - separated by 1 - * spaces
  - terminated: 0 - * spaces, followed by a point
output:
  - words: odd words reversed
  - separated by 1 space
  - terminated: 0 space, followed by a point.
  - edge: "", " ", "."

  - split string by space, place each word in array
  - iterate through words with index
    - if index is even, place in new_string
    - if index odd, reverse word, place in words collection
  - join words in word collection with space between, add period on end
=end

def reverse_odd_words(string)
  words = []
  string.split(/ |\./).each_with_index do |word, index|
    words << word if index.even?
    words << word.reverse if index.odd?
  end
  p words.join(' ').concat(".")
end

p reverse_odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p reverse_odd_words("For all.") == "For lla."
p reverse_odd_words("Hello everyone, tonight .") == "Hello ,enoyreve tonight."
p reverse_odd_words("hello.") == "hello."
