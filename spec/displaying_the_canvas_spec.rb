require 'spec_helper'

describe 'Displaying the image' do
  describe 'S' do
    it 'displays the image to an output' do
      image = double :image
      output_stream = double :output_stream
      expect(image).to receive(:display).with output_stream

      BitmapEditor.new(image, output_stream).run 'S'
    end
  end

  describe 's' do
    it 'displays the image to an output' do
      image = double :image
      output_stream = double :output_stream
      expect(image).to receive(:display).with output_stream

      BitmapEditor.new(image, output_stream).run 's'
    end
  end
end
