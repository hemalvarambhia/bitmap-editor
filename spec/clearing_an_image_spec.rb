require 'spec_helper'

describe 'Clearing an image' do
  describe 'C' do
    it 'clears the image' do
      image = double(:image)
      expect(image).to receive(:clear)
      
      bitmap_editor = BitmapEditor.new(image)
      bitmap_editor.run 'C'
    end
  end

  describe 'c' do
    it 'clears the image' do
      image = double(:image)
      expect(image).to receive(:clear)
      
      bitmap_editor = BitmapEditor.new(image)
      bitmap_editor.run 'c'
    end
  end
end
