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
      y = command.split(' ')[2].to_i
      @image.paint_pixel(coordinate: OpenStruct.new(x: 1, y: y), colour: 'A')
    end  
  end
end
