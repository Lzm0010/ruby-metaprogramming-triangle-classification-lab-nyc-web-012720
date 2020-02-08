class Triangle
  attr_accessor :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @type = nil
  end

  def no_sides_zero
    @s1 != 0 && @s2 != 0 && @s3 != 0
  end

  def no_negatives
    @s1 > 0 && @s2 > 0 && @s3 > 0
  end

  def no_triangle_inequality
    @s1 + @s2 > @s3 && @s2 + @s3 > @s1 && @s1 + @s3 > @s2
  end



  def kind
    if self.no_negatives && self.no_sides_zero && self.no_triangle_inequality
      if s1 == s2 && s1 == s3
        @type = :equilateral
      elsif s1 != s2 && s1 != s3 && s2 != s3
        @type = :scalene
      elsif s1 == s2 || s1 == s3 || s2 == s3
        @type = :isosceles
      end
    else
      raise TriangleError
    end
  end
  
  class TriangleError < StandardError

  end
end
