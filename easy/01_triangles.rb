=begin
- Problem: (input/output/Rules/Questions)
  - input: 3 numbers for the sides of a triangle
  - output: string "equilateral", "Isosceles", or "scalene"
  - Rules
    - to be a triagle
      - all lengths > 0
        - no negative numbers
        - no triple zero
      - sum of any two lengths >= the third
        first, last | first, second | second, third
    - equilateral
      - 3 sides equal length (small, large)
      - if true then return string "equilateral"
    - isoscles
      - 2 sides the same length, 3rd doesn't matter
      - first, second | first, third | second, third
    - scalene
      - 3 sides of different lengths
        - ascending, descending, small, large.

- Examples (test cases)
  - see test cases

- Data Structure
  - collect in array

- Algorithm (mental model)
  - constructor
    -  Save the three side lengths
    - Check whether any side length is less than or equal to zero. If so, raise an exception.
    - Use comparisons to determine whether the sum of any two side lengths is less than or equal 
      to the length of the third side. If so, raise an exception.

  - Method: kind
    - Compare the values representing the three side lengths
    - If all three side lengths are equal return 'equilateral'.
    - If the triangle is not equilateral, but any two side lengths are equal to one another, return 'isosceles'.
    - If none of the side lengths are equal to one another, return 'scalene'.


- Code (Implement a solution)
=end

class Triangle
  attr_reader :sides
  def initialize(*sides)
    @sides = sides
    raise(ArgumentError.new, "Invalid triangle lengths") unless valid?
  end

  def kind
    if sides.uniq.size == 1
      "equilateral"
    elsif sides.uniq.size == 2
      "isoscles"
    else
      "scalene"
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] >= sides[2] &&
    sides[1] + sides[2] >= sides[0] &&
    sides[2] + sides[0] >= sides[1]
  end

end

