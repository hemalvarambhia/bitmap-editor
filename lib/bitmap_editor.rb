class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    case command[0]
    when 'I'
      _, width, height = command.split(' ')
      @image.create(width: width.to_i.abs, height: height.to_i.abs)
    when 'L'
      x = command.split(' ')[1].to_i
      y = command.split(' ')[2].to_i
      @image.paint_pixel(coordinate: OpenStruct.new(x: x, y: y), colour: 'A')
    end  
  end
end
