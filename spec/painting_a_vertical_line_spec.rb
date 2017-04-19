require 'ostruct'
require 'spec_helper'

describe 'Painting a vertical line' do
  describe 'V 1 1 1 X' do
    it "paints a pixel at (1, 1) the colour 'X'" do
      image = double(:image)
      line = [ OpenStruct.new(x: 1, y: 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      BitmapEditor.new(image).run('V 1 1 1 X')
    end
  end

  describe 'V 2 1 1 X' do
    it "paints a pixel at (2, 1) the colour 'X'" do
      image = double(:image)
      line = [ OpenStruct.new(x: 2, y: 1) ]
      expect(image).to receive(:paint_line).with(line, 'X')

      BitmapEditor.new(image).run('V 2 1 1 X')
    end
  end
end
