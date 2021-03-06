require 'spec_helper'
require 'image'
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
      
      white_image = 'O'
      expect(image.to_s).to eq white_image
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

      white_image = 'OO'
      expect(image.to_s).to eq white_image
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

      white_image = "OO\nOO\nOO"
      expect(image.to_s).to eq white_image
    end
  end

  context 'given a 3 x 3 image' do
    before(:each) { image.create(width: 3, height: 3) }
    
    it "paints a pixel the colour 'A' at (2, 1)" do
      image.paint_pixel(coordinate(2, 1), 'A')

      expect(image.to_s).to eq "OAO\nOOO\nOOO"
    end

    it "paints a pixel the colour 'A' at (3, 3)" do
      image.paint_pixel(coordinate(3, 3), 'A')

      expect(image.to_s).to eq "OOO\nOOO\nOOA"
    end

    it "paints a pixel the colour 'B' at (1, 3)" do
      image.paint_pixel(coordinate(1, 3), 'B')

      expect(image.to_s).to eq "OOO\nOOO\nBOO"
    end

    context 'when the coordinate is outside of the image' do
      it 'does not paint at that point'
    end
  end

  context 'given a 4 x 3 image' do
    before(:each) { image.create(width: 4, height: 3) }
    
    it 'paints a line from (1, 1) to (2, 1) the colour T' do
      line = [coordinate(1, 1), coordinate(2, 1)]

      image.paint_line(line, 'T')

      expect(image.to_s).to eq "TTOO\nOOOO\nOOOO"
    end

    it 'paints a line from (1, 1) to (3, 1) the colour T' do
      line = [ coordinate(1, 1), coordinate(2, 1), coordinate(3, 1) ]

      image.paint_line(line, 'T')

      expect(image.to_s).to eq "TTTO\nOOOO\nOOOO"
    end

    it 'paints a line from (1, 1) to (1, 3) the colour T' do
      line = [ coordinate(1, 1), coordinate(1, 2), coordinate(1, 3) ]

      image.paint_line(line, 'T')

      expect(image.to_s).to eq "TOOO\nTOOO\nTOOO"
    end

    it 'paints a line from (2, 1) to (2, 3) the colour A' do
      line = [ coordinate(2, 1), coordinate(2, 2), coordinate(2, 3) ]

      image.paint_line(line, 'A')

      expect(image.to_s).to eq "OAOO\nOAOO\nOAOO"
    end

    context 'when the start and end co-ordinates are outside the image' do
      it 'does not paint at those points'
    end
  end

  context 'given a 3 x 4 image with a line painted T' do
    before(:each) do
      image.create(width: 3, height: 4)
      line = [ coordinate(1, 1), coordinate(2, 1), coordinate(3, 1) ]
      image.paint_line(line, 'T')
    end

    it 'clears the image' do
      image.clear

      white_image = "OOO\nOOO\nOOO\nOOO"
      expect(image.to_s).to eq white_image
    end
  end

  context 'given a 4 x 4 image with a line painted P' do
    before(:each) do
      image.create(width: 4, height: 4)
      line = [ 
        coordinate(1, 1), coordinate(2, 1), coordinate(3, 1), coordinate(4, 1)
      ]
      image.paint_line(line, 'P')
    end

    it 'clears the image' do
      image.clear

      white_image = "OOOO\nOOOO\nOOOO\nOOOO"
      expect(image.to_s).to eq white_image
    end
  end

  describe '#to_s' do
    it 'generates a string representation of an image' do
      image.create(width: 2, height: 2)

      expect(image.to_s).to eq "OO\nOO"
    end

    it 'generates a string representation of any image' do
      image.create(width: 4, height: 3)
      image.paint_pixel(coordinate(1, 1), 'T')
      image.paint_pixel(coordinate(2, 2), 'T')
      image.paint_pixel(coordinate(3, 3), 'T')

      expect(image.to_s).to eq "TOOO\nOTOO\nOOTO"
    end
  end
end
