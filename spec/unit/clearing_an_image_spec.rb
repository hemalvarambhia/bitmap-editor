require 'spec_helper'

describe 'Clearing an image' do
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image, nil) }
  describe 'C' do
    it 'clears the image' do
      expect(image).to receive(:clear)
      
      bitmap_editor.run 'C'
    end
  end

  describe 'c' do
    it 'clears the image' do
      expect(image).to receive(:clear)
      
      bitmap_editor.run 'c'
    end
  end
end
