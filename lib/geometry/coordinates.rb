require 'ostruct'
module Geometry
  module Coordinates
    def coordinate(x, y)
     OpenStruct.new(x: x, y: y)
    end

    def horizontal_line(points)
      from, to = points[:from], points[:to]
      from_x, to_x = [from.x, to.x].sort
      from_x.upto(to_x).map { |x| coordinate(x, from.y) }
    end

    def vertical_line(end_points)
      from, to = end_points[:from], end_points[:to]
      from_y, to_y = [from.y, to.y].sort
      from_y.upto(to_y).map { |y| coordinate(from.x, y) }
    end
  end
end
