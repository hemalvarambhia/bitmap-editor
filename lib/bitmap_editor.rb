require 'geometry/coordinates'
class BitmapEditor
  include Geometry::Coordinates
  
  def initialize(image, display)
    @image = image
    @display = display
  end

  def run(command)
    type, *args = command.upcase.split(' ')
    case type
    when 'I'
      create_image(args)
    when 'L'
      paint_pixel(args)
    when 'H'
      paint_horizontal_line(args)
    when 'V'
      paint_vertical_line(args)
    when 'S'
      @display.show @image
    when 'C'
      @image.clear
    end
  end

  private

  def create_image(args)
    width = args[0].to_i.abs
    height = args[1].to_i.abs
    @image.create(width: width, height: height)
  end

  def paint_pixel(args)
    x = args[0].to_i.abs
    y = args[1].to_i.abs
    colour = args[2].upcase
    point = coordinate(x, y)
    @image.paint_pixel(point, colour)
  end

  def paint_horizontal_line(args)
    x_1, x_2 = args[0..1].map(&:to_i).map(&:abs)
    y = args[2].to_i.abs
    line = horizontal_line(from: coordinate(x_1, y), to: coordinate(x_2, y))
    colour = args[3]
    @image.paint_line(line, colour)
  end

  def paint_vertical_line(args)
    y_1, y_2 = args[1..2].map(&:to_i).map(&:abs)
    x = args[0].to_i.abs
    line = vertical_line(from: coordinate(x, y_1), to: coordinate(x, y_2))
    colour = args[3]
    @image.paint_line(line, colour)
  end
end
