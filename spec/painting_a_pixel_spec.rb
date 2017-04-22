require 'spec_helper'
require 'geometry/coordinates'
describe 'Painting a pixel' do
  include Geometry::Coordinates
  let(:bitmap_image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(bitmap_image) }

  describe 'L 1 1 A' do
    it "paints co-ordinate (1, 1) the colour 'A'" do
      coordinate = coordinate(1, 1)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 1 1 A')
    end
  end

  describe 'L 1 2 A' do
    it "paints co-ordinate (1, 2) the colour 'A'" do
      coordinate = coordinate(1, 2)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 1 2 A')
    end
  end

  describe 'L 3 5 A' do
    it "paints co-ordinate (3, 5) the colour 'A'" do
      coordinate = coordinate(3, 5)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 3 5 A')
    end
  end

  describe 'L 6 7 X' do
    it "paints co-ordinate (6, 7) the colour 'X'" do
      coordinate = coordinate(6, 7)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'X')

      bitmap_editor.run('L 6 7 X')
    end
  end

  describe 'L 3 1 a' do
    it "paints co-ordinate (3, 1) the colour 'A'" do
      coordinate = coordinate(3, 1)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 3 1 a') 
    end
  end 

  describe 'L -3 8 R' do
    it "paints co-ordinate (3, 8) the colour 'R'" do
      coordinate = coordinate(3, 8)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(hash_including(coordinate: coordinate))

      bitmap_editor.run('L -3 8 R') 
    end
  end 

  describe 'L 10 -11 Z' do
    it "paints co-ordinate (10, 11) the colour 'Z'" do
      coordinate = coordinate(10, 11)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(hash_including(coordinate: coordinate))

      bitmap_editor.run('L 10 -11 Z') 
    end
  end

  describe 'l 4 5 z' do
    it "paints co-ordinate (4, 5) the colour 'Z" do
      coordinate = coordinate(4, 5)
      expect(bitmap_image)
        .to receive(:paint_pixel).with(coordinate: coordinate, colour: 'Z')

      bitmap_editor.run('l 4 5 z')
    end
  end

  describe 'L 2 251 A' do
    it "paints co-ordinate (2 250) 'A'"
  end

  describe 'L 0 150 A' do
    it "paints co-ordinate (1 150) 'A'"
  end
end
