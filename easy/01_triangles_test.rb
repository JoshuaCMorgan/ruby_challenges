require 'minitest/autorun'
require_relative '01_triangles'

class TriangleTest < Minitest::Test

  def test_equilateral_large_equal_sides
    triangle = Triangle.new(30, 30, 30)
    assert_equal("equilateral", triangle.kind)
  end

  def test_equilateral_small_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal("equilateral", triangle.kind)
  end

  def test_isoscles_first_two_sides_equal
    triangle = Triangle.new(20, 20, 30)
    assert_equal("isoscles", triangle.kind)
  end

  def test_isoscles_last_two_sides_equal
    triangle = Triangle.new(12, 10, 10)
    assert_equal("isoscles", triangle.kind)
  end

  def test_isoscles_first_last_sides_equal
    triangle = Triangle.new(4, 7, 4)
    assert_equal("isoscles", triangle.kind)
  end

  def test_scalene_no_equal_sides
    triangle = Triangle.new(10, 20, 15)
    assert_equal("scalene", triangle.kind)
  end

  def test_scalene_ascending_no_equal_sides
    triangle = Triangle.new(4, 6, 8)
    assert_equal("scalene", triangle.kind)
  end

  def test_scalene_small_are_legal
    triangle = Triangle.new(0.3, 0.5, 0.4)
    assert_equal("scalene", triangle.kind)
  end

  def test_scalene_decending_no_equal_sides
    triangle = Triangle.new(10, 8, 6)
    assert_equal("scalene", triangle.kind)
  end

  def test_no_size_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_size_negative_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 5, -3)
    end
  end

  def test_size_inequality_1
    # sum of first two must be greater than third
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_2
    # sum of 1st & 3rd greater than 2nd
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 8, 4)
    end
  end

  def test_size_inequality_3
    # sum of 2nd & 3rd greater than first
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 3, 1)
    end
  end

end