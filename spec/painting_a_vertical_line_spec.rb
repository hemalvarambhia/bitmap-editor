require 'spec_helper'
require 'geometry/coordinates'
describe 'Painting a vertical line' do
  include Geometry::Coordinates
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image) }

  describe 'V 1 1 1 X' do
    it "paints a pixel at (1, 1) the colour 'X'" do
      line = [ coordinate(1, 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 1 1 1 X')
    end
  end

  describe 'V 2 1 1 X' do
    it "paints a pixel at (2, 1) the colour 'X'" do
      line = [ coordinate(2, 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 2 1 1 X')
    end
  end

  describe 'V 1 3 3 X' do
    it "paints a pixel at (1, 3) the colour 'X'" do
      line = [ coordinate(1, 3) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 1 3 3 X')
    end
  end

  describe 'V 3 1 3 X' do
    it "paints a vertical line from (3, 1) to (3, 3) the colour 'X'" do
      line = [ coordinate(3, 1), coordinate(3, 2), coordinate(3, 3) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 3 1 3 X')
    end
  end

  describe 'V 5 4 1 X' do
    it "paints a vertical line from (5, 1) to (5, 4)" do
      line = [
        coordinate(5, 1), coordinate(5, 2),
        coordinate(5, 3), coordinate(5, 4) ]
      expect(image).to receive(:paint_line).with(line, any_args)

      bitmap_editor.run('V 5 4 1 X')
    end
  end

  describe 'V 2 4 7 Y' do
    it "paints a vertical line the colour 'Y'" do
      expect(image).to receive(:paint_line).with(any_args, 'Y')

      bitmap_editor.run('V 2 4 7 Y')
    end
  end

  describe 'V 3 4 5 r' do
    it "paints a vertical line the colour 'R'" do
      expect(image).to receive(:paint_line).with(any_args, 'R')

      bitmap_editor.run('V 3 4 5 r')
    end
  end

  describe 'v 5 2 3 i' do
    it "paints a vertical line from (5, 2) to (5, 3) the colour 'i'" do
      expect(image).to receive(:paint_line)

      bitmap_editor.run('v 5 2 3 i')
    end
  end

  describe 'V -3 4 6 X' do
    it 'paints a vertical line from (3, 4) to (3, 6)' do
      line = [
        coordinate(3, 4), coordinate(3, 5), coordinate(3, 6) ]
      expect(image).to receive(:paint_line).with(line, any_args)

      bitmap_editor.run('V -3 4 6 X')
    end
  end
end
