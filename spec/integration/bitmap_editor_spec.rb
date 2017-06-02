require 'spec_helper'
require 'display'
require 'image'
describe BitmapEditor do
  let(:output_object) { StringIO.new }
  let(:terminal) { Display.new(output_object) }
  let(:image) { Image.new }
  let(:editor) { BitmapEditor.new(image, terminal) }
  
  it 'generates a 5px x 6px white image' do
    editor.run 'I 5 6'

    expected = "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end

  it 'paints a pixel on a 5px x 6px image' do
    editor.run 'I 5 6'

    editor.run 'L 2 3 A'
    
    expected = "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end

  it 'paints a horizontal line on a 5px x 6px white image' do
    editor.run 'I 5 6'

    editor.run 'H 3 5 2 Z'

    expected = "OOOOO\nOOZZZ\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
    expect(image.to_s).to eq expected
  end

  it 'paints a vertical line on a 5px x 6px white image' do
    editor.run 'I 5 6'

    editor.run 'V 2 3 6 W'

    expected = "OOOOO\nOOOOO\nOWOOO\nOWOOO\nOWOOO\nOWOOO"
    expect(image.to_s).to eq expected
  end

  it 'clears any pixel/line on a 5px x 6px white image' do
    editor.run 'I 5 6'
    editor.run 'V 2 3 6 W'

    expect { editor.run 'C'}
      .to change(image, :to_s)
      .from("OOOOO\nOOOOO\nOWOOO\nOWOOO\nOWOOO\nOWOOO")
      .to "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO"
  end

  it 'prints the image to a display' do
    editor.run 'I 5 6'
    editor.run 'V 2 3 6 W'
    editor.run 'H 3 5 2 Z'

    editor.run 'S'

    expect(output_object.string)
      .to eq "OOOOO\nOOZZZ\nOWOOO\nOWOOO\nOWOOO\nOWOOO\n"
  end
end
