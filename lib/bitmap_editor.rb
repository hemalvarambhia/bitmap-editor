require 'geometry/coordinates'
class BitmapEditor
  include Geometry::Coordinates
  
  def initialize(image, output_stream = nil)
    @image = image
    @output_stream = output_stream
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
      @image.display @output_stream
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
    @image.paint_pixel(coordinate: point, colour: colour)
  end

  def paint_horizontal_line(args)
    x_1, x_2 = args[0..1].map(&:to_i).map(&:abs).sort
    y = args[2].to_i.abs
    colour = args[3]
    line = x_1.upto(x_2).map { |x| coordinate(x, y) }
    @image.paint_line(line, colour)
  end

  def paint_vertical_line(args)
    y_1, y_2 = args[1..2].map(&:to_i).map(&:abs).sort
    x = args[0].to_i.abs
    line = y_1.upto(y_2).map { |y| coordinate(x, y) }
    colour = args[3]
    @image.paint_line(line, colour)
  end
end
