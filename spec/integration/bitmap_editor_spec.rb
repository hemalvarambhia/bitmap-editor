require 'spec_helper'
require 'image'
describe BitmapEditor do
  it 'generates a 5px x 6px white image' do
    image = Image.new
      
    BitmapEditor.new(image, nil).run 'I 5 6'

    expected = "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end
end
