class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    case command[0]
    when 'I'
      width = command.split(' ')[1].to_i.abs
      height = command.split(' ')[2].to_i.abs
      @image.create(width: width, height: height)
    when 'L'
      @image.paint_pixel(coordinate: OpenStruct.new(x: 1, y: 1), colour: 'A')
    end  
  end
end
