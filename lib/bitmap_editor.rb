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
      x = args[0].to_i
      y = args[1].to_i
      colour = args[2].upcase
      @image.paint_pixel(coordinate: OpenStruct.new(x: x, y: y), colour: colour)
    end  
  end
end
