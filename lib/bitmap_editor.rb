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
      x = args[0].to_i
      @image.paint_line([ OpenStruct.new(x: x, y: 1) ], 'X')
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
    point = OpenStruct.new(x: x, y: y)
    @image.paint_pixel(coordinate: point, colour: colour)
  end

  def paint_horizontal_line(args)
    range = args[0..1].map(&:to_i).map(&:abs).sort
    from_x = range.first
    to_x = range.last
    y = args[2].to_i.abs
    colour = args[3]
    line = from_x.upto(to_x).map { |x| OpenStruct.new(x: x, y: y) }
    @image.paint_line(line, colour)
  end
end
