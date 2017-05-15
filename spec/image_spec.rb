require 'spec_helper'

class Image
  attr_reader :pixels
  def create(dimensions)
    @pixels = Array.new(dimensions[:height]) { 'O' * dimensions[:width] }
  end

  def paint_pixel(coordinate, colour)
    @pixels[coordinate.y - 1][coordinate.x - 1] = 'A'
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
  end
end
