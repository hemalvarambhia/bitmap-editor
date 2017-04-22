class BitmapEditor
  def initialize(image)
    @image = image
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
    from_x, to_x = args[0..1].map(&:to_i).map(&:abs).sort
    y = args[2].to_i.abs
    colour = args[3]
    line = from_x.upto(to_x).map { |x| coordinate(x, y) }
    @image.paint_line(line, colour)
  end

  def paint_vertical_line(args)
    from_y, to_y = args[1..2].map(&:to_i).map(&:abs).sort
    x = args[0].to_i
    line = from_y.upto(to_y).map { |y| coordinate(x, y) }
    colour = args[3]
    @image.paint_line(line, colour)
  end

  def coordinate(x, y)
    OpenStruct.new(x: x, y: y)
  end
end
