require 'ostruct'
module Geometry
  module Coordinates
    def coordinate(x, y)
     OpenStruct.new(x: x, y: y)
    end

    def horizontal_line(points)
      from, to = points[:from], points[:to]
      from.x.upto(to.x).map { |x| coordinate(x, from.y) }
    end

    def vertical_line(end_points)
      from, to = end_points[:from], end_points[:to]
      from.y.upto(to.y).map { |y| coordinate(from.x, y) }
    end
  end
end
