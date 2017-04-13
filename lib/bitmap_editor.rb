class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    type, *args = command.split(' ')
    case type
    when 'I'
      width = args[0].to_i.abs
      height = args[1].to_i.abs
      @image.create(width: width, height: height)
    when 'L'
      x = args[0].to_i.abs
      y = args[1].to_i.abs
      colour = args[2].upcase
      @image.paint_pixel(coordinate: OpenStruct.new(x: x, y: y), colour: colour)
    when 'H'
      to_x = args[1].to_i
      from = OpenStruct.new(x: 1, y: 1)
      to = OpenStruct.new(x: to_x, y: 1)
      @image.paint_horizontal_line(from: from, to: to, colour: 'I')
    end  
  end
end
