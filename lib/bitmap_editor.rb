class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    type, *args = command.split(' ')
    case type
    when 'I'
      create_image(args)
    when 'L'
      paint_pixel(args)
    when 'H'
      paint_horizontal_line(args)
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
    @image.paint_pixel(coordinate: OpenStruct.new(x: x, y: y), colour: colour)
  end

  def paint_horizontal_line(args)
    from_x = args[0].to_i
    to_x = args[1].to_i
    y = args[2].to_i
    colour = args[3]
    from = OpenStruct.new(x: from_x, y: y)
    to = OpenStruct.new(x: to_x, y: y)
    @image.paint_horizontal_line(from: from, to: to, colour: colour)
  end
end
