require 'ostruct'
require_relative '../lib/bitmap_editor'
describe 'Painting a pixel' do
  let(:bitmap_image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(bitmap_image) }

  describe 'L 1 1 A' do
    it "paints co-ordinate (1, 1) the colour 'A'" do
      coordinate = OpenStruct.new(x: 1, y: 1)
      expect(bitmap_image).to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 1 1 A')
    end
  end

  describe 'L 1 2 A' do
    it "paints co-ordinate (1, 2) the colour 'A'" do
      coordinate = OpenStruct.new(x: 1, y: 2)
      expect(bitmap_image).to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 1 2 A')
    end
  end

  describe 'L 3 5 A' do
    it "paints co-ordinate (3, 5) the colour 'A'" do
      coordinate = OpenStruct.new(x: 3, y: 5)
      expect(bitmap_image).to receive(:paint_pixel).with(coordinate: coordinate, colour: 'A')

      bitmap_editor.run('L 3 5 A')
    end
  end

  describe 'L 6 7 X' do
    it "paints co-ordinate (6, 7) the colour 'X'"
  end
end
