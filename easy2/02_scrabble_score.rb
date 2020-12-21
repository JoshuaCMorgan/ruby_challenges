=begin
Write a program that, given a word, computes the scrabble score for that word.
Letter Values

You'll need these:

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

Examples

"cabbage" should be scored as worth 14 points:

    3 points for C
    1 point for A, twice
    3 points for B, twice
    2 points for G
    1 point for E

And to total:

    3 + 2*1 + 2*3 + 2 + 1
    = 3 + 2 + 6 + 3
    = 5 + 9
    = 14

=end

=begin
- Problem: (input/output/Rules/Questions)
  -input: string of characters
  -output: scrabble score for that word
  -Rules: 
    -see scoring above
    - if not letter, give zero

- Examples (test cases)
  - cabbage = 14 
- Data Structure

- Algorithm (mental model)
  - from a collection of characters, translate to collection of value
  and reduce to sum

  - initialize word
      - handle nil value (convert to string) and upcase each char
  - iterate through each character
      - retrieve value of character, increment sum by value
=end

class Scrabble
  def initialize(word)
    @word = word.to_s.upcase
  end

  def self.score(word)
    new(word).score
  end

  def score
    sum = 0

    @word.each_char do |letter|
      sum += retrieve_value(letter)
    end
    sum
  end

  private

  def retrieve_value(letter)
    case letter
    when "A","E","I","O","U","L","N","R","S","T" then 1
    when "D", "G"                                then 2
    when "B", "C", "M", "P"                      then 3
    when "F", "H", "V", "W", "Y"                 then 4
    when "K"                                     then 5
    when "J", "X"                                then 8
    when "Q", "Z"                                then 10
    else                                              0
    end
  end
end