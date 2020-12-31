=begin

Grade School

Write a small archiving program that stores students' names along with the grade that they are in.

In the end, you should be able to:

    Add a student's name to the roster for a grade
        "Add Jim to grade 2."
        "OK."
    Get a list of all students enrolled in a grade
        "Which students are in grade 2?"
        "We've only got Jim just now."

    Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and 
    students within a grade should be sorted alphabetically by name.

{1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}

    The exact output format doesn't matter: what's important is that it shows all of the students 
    and grades in the proper order.

Note that all our students only have one name. (It's a small town, what do you want?)
=end

=begin
- Problem: (input/output/Rules/Questions)
  - input: student's first name and grade level
  - output: the grade level and each student therein

  Rules
    - organized by grades in ascending order (1, 2, 3)
    - names are alphabetized (alex, anne, betty)
    - should be able to able to return empty roster (empty container)
    - add
      - contains name and grade
    - retrieve roster
      - hash with grade as key, value as names
    - retrieve grade
      - should return array of students in grade

- Examples (test cases)

- Data Structure
  - hash

- Algorithm (mental model)
  -create a program that allows you to input a students first name along with their grade level.
    and also retrieve  a alphabeticalized roster of all students according to grade level.
  
  - initialize school with school_roster hash with default array value
  - add student
    - if grade level exists, add student name to array list of values
      - else, create key and set value to array element name
    - sort string values alphabetically
  
  - get a list of students enrolled
    - all students
      - return hash
    - in a particular grade
      - get values of key

- Code (Implement a solution)

=end

class School
  def initialize
   @roster = {}
  end

  def add(name, grade)
    @roster[grade] = [] unless @roster[grade]
    @roster[grade] << name
  end

  def grade(_grade)
   return [] unless @roster[_grade]
   @roster[_grade]
  end

  def to_h
    result = {}
    @roster.keys.sort.each do |key|
      result[key] = @roster[key].sort
    end
    result
  end
end
