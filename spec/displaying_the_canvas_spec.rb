require 'spec_helper'

describe 'Displaying the image' do
  let(:image) { double(:image) }
  let(:output_stream) { double(:output_stream) }
  let(:bitmap_editor) { BitmapEditor.new(image, output_stream) }

  describe 'S' do
    it 'displays the image to an output' do
      expect(image).to receive(:display).with output_stream

      bitmap_editor.run 'S'
    end
  end

  describe 's' do
    it 'displays the image to an output' do
      expect(image).to receive(:display).with output_stream

      bitmap_editor.run 's'
    end
  end
end
