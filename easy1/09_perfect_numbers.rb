=begin
The Greek mathematician Nicomachus devised a classification scheme 
for natural numbers, identifying each as belonging uniquely to the 
categories of abundant, perfect, or deficient. A perfect number 
equals the sum of its positive divisors — the pairs of numbers 
whose product yields the target number, excluding the number 
itself. This sum is known as the Aliquot sum.

    Perfect: Sum of factors = number
    Abundant: Sum of factors > number
    Deficient: Sum of factors < number

Examples:

    6 is a perfect number because its divisors are 1, 2, 3 and 6 = 
    1 + 2 + 3.
    28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
    Prime numbers 7, 13, etc are deficient by the Nicomachus 
    classification.

Write a program that can tell if a number is perfect, abundant or 
deficient.
=end

=begin
  - raise 'StandardError' if number is less than 1
  - set empty array to factors
  - find all factors of given number and sum
    - iterate from 1 upto but not given number
      - if given number div by current num is zero
        - put in factors array
    sum factors
  - compare sum to given number and return appropriate message
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError, "Please give a valid number" if number < 2

   
    factors = (1...number).select { |num| number % num == 0 }
  
    total = divisors.sum
    
    case
    when total > number then "abundant"
    when total < number then  "deficient"
    when total == number then "perfect"
    end
  end
end


