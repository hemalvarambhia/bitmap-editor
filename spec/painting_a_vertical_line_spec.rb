require 'ostruct'
require 'spec_helper'

describe 'Painting a vertical line' do
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image) }

  describe 'V 1 1 1 X' do
    it "paints a pixel at (1, 1) the colour 'X'" do
      line = [ OpenStruct.new(x: 1, y: 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 1 1 1 X')
    end
  end

  describe 'V 2 1 1 X' do
    it "paints a pixel at (2, 1) the colour 'X'" do
      line = [ OpenStruct.new(x: 2, y: 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 2 1 1 X')
    end
  end

  describe 'V 1 3 3 X' do
    it "paints a vertical line from (1, 3) the colour 'X'" do
      line = [ OpenStruct.new(x: 1, y: 3) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      bitmap_editor.run('V 1 3 3 X')
    end
  end
end
