=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a 
nucleic acid, in particular DNA. Because nucleic acids are vital to cellular 
functions, mutations tend to cause a ripple effect throughout the cell. 
Although mutations are technically mistakes, a very rare mutation may equip the 
cell with a beneficial attribute. In fact, the macro effects of evolution are 
attributable by the accumulated result of beneficial microscopic mutations over 
many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, 
which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken 
from different genomes with a common ancestor, we get a measure of the minimum 
number of point mutations that could have occurred on the evolutionary path 
between the two strands.

This is called the 'Hamming distance'

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have 
two sequences of unequal length, you should compute the Hamming distance over 
the shorter length.
=end

=begin
  input a string containting any sequence of only 3 different letters
  output an integer which will represent the hamming distance.

  rules
    - letters of significance is length of original string, no more.
      - ignore comparison string elements that are greater than original
      - a shorter comparison string does not add to distance.
    - distance is increased when sequencial letter is not equal to original.

  algorithm
    - iterate through characters of both string, comparing them.
      - if characters are not equal value, increment distance by 1
      - else, next
      - break if value is nil
=end

class DNA

  def initialize(original_strand)
    @original_strand = original_strand
  end 

  def hamming_distance(test_strand)
    total_distance = 0

    @strand.each_char.with_index do |letter, index|
      break if test_strand[index] == nil
      total_distance += 1 if @strand[index] != test_strand[index]
    end
    total_distance
  end
end

# Other
def hamming_distance(test_strand)
  effective_length = [@original_strand.size, test_strand.size].min
  distance = 0
  (0..(effective_length-1)).each do |index|
    distance += 1 if @original_strand[index] != test_strand[index]
  end
  distance
end

