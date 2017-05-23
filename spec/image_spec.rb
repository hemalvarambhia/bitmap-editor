require 'spec_helper'

class Image
  attr_reader :pixels
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
end

describe Image do
  include Geometry::Coordinates
  
  let(:image) { Image.new }
  describe 'initialising a 1 x 1 image' do
    it 'has a width of 1 px and a height of 1px' do
      image.create(width: 1, height: 1)

      expect(image.width).to eq 1
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image.create(width: 1, height: 1)

      expect(image.pixels).to eq ['O']
    end
  end

  describe 'initialising a 2 x 1 image' do
    it 'has a width of 2px and a height of 1px' do
      image.create(width: 2, height: 1)

      expect(image.width).to eq 2
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image.create(width: 2, height: 1)

      expect(image.pixels).to eq [ 'OO' ]
    end
  end

  describe 'initialising a 2 x 3 image' do
    it 'has a width of 2px and a height of 3px' do
      image.create(width: 2, height: 3)

      expect(image.width).to eq 2
      expect(image.height).to eq 3
    end

    it 'is painted white' do
      image.create(width: 2, height: 3)

      expect(image.pixels).to eq ['OO', 'OO', 'OO']
    end
  end

  context 'given a 3 x 3 image' do
    before(:each) { image.create(width: 3, height: 3) }
    
    it "paints a pixel the colour 'A' at (2, 1)" do
      image.paint_pixel(coordinate(2, 1), 'A')

      expected = [
        'OAO',
        'OOO',
        'OOO'
      ]
      expect(image.pixels).to eq expected
    end

    it "paints a pixel the colour 'A' at (3, 3)" do
      image.paint_pixel(coordinate(3, 3), 'A')

      expected = [
        'OOO',
        'OOO',
        'OOA'
      ]
      expect(image.pixels).to eq expected
    end

    it "paints a pixel the colour 'B' at (1, 3)" do
      image.paint_pixel(coordinate(1, 3), 'B')

      expected = [
        'OOO',
        'OOO',
        'BOO'
      ]
      expect(image.pixels).to eq expected
    end
  end

  context 'given a 4 x 3 image' do
    before(:each) { image.create(width: 4, height: 3) }
    it 'paints a line from (1, 1) to (2, 1) the colour T' do
      line = [coordinate(1, 1), coordinate(2, 1)]

      image.paint_line(line, 'T')

      expected = [
        'TTOO',
        'OOOO',
        'OOOO'                  
      ]
      expect(image.pixels).to eq expected
    end

    it 'paints a line from (1, 1) to (3, 1) the colour T' do
      line = [ coordinate(1, 1), coordinate(2, 1), coordinate(3, 1) ]

      image.paint_line(line, 'T')

      expected = [
        'TTTO',
        'OOOO',
        'OOOO'                  
      ]
      expect(image.pixels).to eq expected
    end

    it 'paints a line from (1, 1) to (1, 3) the colour T' do
      line = [ coordinate(1, 1), coordinate(1, 2), coordinate(1, 3) ]

      image.paint_line(line, 'T')

      expected = [
        'TOOO',
        'TOOO',
        'TOOO'                  
      ]
      expect(image.pixels).to eq expected
    end

    it 'paints a line from (2, 1) to (2, 3) the colour A' do
      line = [ coordinate(2, 1), coordinate(2, 2), coordinate(2, 3) ]

      image.paint_line(line, 'A')

      expected = [
        'OAOO',
        'OAOO',
        'OAOO'                  
      ]
      expect(image.pixels).to eq expected
    end
  end

  context 'given a 3 x 4 image with a line painted T' do
    it 'clears the image' do
      image.create(width: 3, height: 4)
      line = [ coordinate(1, 1), coordinate(2, 1), coordinate(3, 1) ]
      image.paint_line(line, 'T')
      
      image.clear

      white_image = [ 'OOO', 'OOO', 'OOO', 'OOO' ]
      expect(image.pixels).to eq white_image
    end
  end
end
