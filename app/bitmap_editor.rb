class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    width = command.split(' ')[1].to_i.abs
    height = command.split(' ')[2].to_i.abs
    @image.create(width: width, height: height)
  end
end
