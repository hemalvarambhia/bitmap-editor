require 'ostruct'
module Geometry
  module Coordinates
    def coordinate(x, y)
     OpenStruct.new(x: x, y: y)
    end
  end
end
