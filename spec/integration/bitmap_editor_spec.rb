require 'spec_helper'
require 'image'
describe BitmapEditor do
  it 'generates a 5px x 6px white image' do
    image = Image.new
      
    BitmapEditor.new(image, nil).run 'I 5 6'

    expected = "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end

  it 'paints a pixel on a 5px x 6px image' do
    image = Image.new
    editor = BitmapEditor.new(image, nil)
    editor.run 'I 5 6'

    editor.run 'L 2 3 A'
    
    expected = "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end
end
