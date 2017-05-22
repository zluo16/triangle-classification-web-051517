class Triangle

  attr_accessor :tri_sides

  def initialize(side1, side2, side3)
    @tri_sides = []
    @tri_sides.push(side1, side2, side3)
  end

  def kind
    if error_tester
      raise TriangleError
    end

    if tri_sides.uniq.length == 1
      :equilateral
    elsif tri_sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  def error_tester
    if side_adder
      true
    elsif tri_sides.any?{|side| side <= 0}
      true
    end
  end

  def side_adder
    if tri_sides[0] + tri_sides[1] <= tri_sides[2]
      true
    elsif tri_sides[0] + tri_sides[2] <= tri_sides[1]
      true
    elsif tri_sides[2] + tri_sides[1] <= tri_sides[0]
      true
    else
      false
    end
  end

end

class TriangleError < StandardError
end
