class Image
  def create(dimensions)
    @pixels = Array.new(dimensions[:height]) { 'O' * dimensions[:width] }
  end

  def paint_pixel(coordinate, colour)
    @pixels[coordinate.y - 1][coordinate.x - 1] = colour
  end

  def paint_line(line, colour)
    line.each { |coordinate| paint_pixel(coordinate, colour) }
  end

  def clear
    @pixels = Array.new(height) { 'O' * width }
  end
  
  def width
    @pixels[0].size
  end

  def height
    @pixels.size
  end

  def to_s
    @pixels.join("\n")
  end
end
