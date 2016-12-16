require 'pry'
class Triangle
  attr_accessor :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def sides
    [s1, s2, s3].sort
  end

  def equal_sides
    num_equal_sides = 0
    sides.each do |s|
      equal_sides = sides.collect {|other_side| other_side == s}
      num_equal_sides = [equal_sides.count(true), num_equal_sides].max
    end
    num_equal_sides
  end

  def valid?
    if sides.any? { |s| s <= 0 } || sides[0] + sides[1] <= sides[2]
      raise TriangleError
    end
  end

  def kind
    valid?

    if equal_sides == 3
      :equilateral
    elsif equal_sides == 2
      :isosceles
    elsif equal_sides == 1
      :scalene
    else
      raise TriangleError
    end
  end
end

class TriangleError < StandardError
end
