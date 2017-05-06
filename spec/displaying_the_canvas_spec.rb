require 'spec_helper'

describe 'Displaying the image' do
  let(:image) { double(:image) }
  let(:display) { double(:display) }
  let(:bitmap_editor) { BitmapEditor.new(image, display) }

  describe 'S' do
    it 'displays the image to an output' do
      expect(display).to receive(:show).with image

      bitmap_editor.run 'S'
    end
  end

  describe 's' do
    it 'displays the image to an output' do
      expect(display).to receive(:show).with image

      bitmap_editor.run 's'
    end
  end
end
