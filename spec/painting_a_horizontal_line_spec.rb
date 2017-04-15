require 'ostruct'
require 'bitmap_editor'
describe 'H 1 1 1 I' do
  it "paints a pixel at (1, 1) the colour 'I'" do
    image = double(:image)
    expect(image).to(receive(:paint_horizontal_line).with(
                      from: OpenStruct.new(x: 1, y: 1),
                      to: OpenStruct.new(x: 1, y: 1),
                      colour: 'I'))

    BitmapEditor.new(image).run('H 1 1 1 I')
  end
end

describe 'H 1 3 1 I' do
  it "paints a horizontal line from (1, 1) to (3, 1) the colour 'I'" do
    image = double(:image)
    expect(image).to receive(:paint_horizontal_line).with(
                       from: OpenStruct.new(x: 1, y: 1),
                       to: OpenStruct.new(x: 3, y: 1),
                       colour: 'I'
                     )

    BitmapEditor.new(image).run('H 1 3 1 I')
  end
end

describe 'H 3 5 1 I' do
  it "paints a horizontal line from (3, 1) to (5, 1) the colour 'I'" do
    image = double(:image)
    expect(image).to receive(:paint_horizontal_line).with(
                       from: OpenStruct.new(x: 3, y: 1),
                       to: OpenStruct.new(x: 5, y: 1),
                       colour: 'I'
                     )

    BitmapEditor.new(image).run('H 3 5 1 I')
  end
end

describe 'H 3 5 7 I' do
  it "paints a horizontal line from (3, 7) to (5, 7) the colour 'I'" do
    image = double(:image)
    expect(image).to(receive(:paint_horizontal_line).with(
                      from: OpenStruct.new(x: 3, y: 7),
                      to: OpenStruct.new(x: 5, y: 7),
                      colour: 'I'))

    BitmapEditor.new(image).run('H 3 5 7 I')
  end
end
