require 'ostruct'
require 'bitmap_editor'
describe 'Painting a horizontal line' do
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image) }
  
  describe 'H 1 1 1 I' do
    it "paints a pixel at (1, 1) the colour 'I'" do
      expect(image).to(receive(:paint_horizontal_line).with(
                        from: OpenStruct.new(x: 1, y: 1),
                        to: OpenStruct.new(x: 1, y: 1),
                        colour: 'I'))

      bitmap_editor.run('H 1 1 1 I')
    end
  end

  describe 'H 1 3 1 I' do
    it "paints a horizontal line from (1, 1) to (3, 1) the colour 'I'" do
      expect(image).to receive(:paint_horizontal_line).with(
                         from: OpenStruct.new(x: 1, y: 1),
                         to: OpenStruct.new(x: 3, y: 1),
                         colour: 'I'
                       )

      bitmap_editor.run('H 1 3 1 I')
    end
  end

  describe 'H 3 5 1 I' do
    it "paints a horizontal line from (3, 1) to (5, 1) the colour 'I'" do
      expect(image).to receive(:paint_horizontal_line).with(
                         from: OpenStruct.new(x: 3, y: 1),
                         to: OpenStruct.new(x: 5, y: 1),
                         colour: 'I'
                       )

      bitmap_editor.run('H 3 5 1 I')
    end
  end

  describe 'H 3 5 7 I' do
    it "paints a horizontal line from (3, 7) to (5, 7) the colour 'I'" do
      expect(image).to(receive(:paint_horizontal_line).with(
                        from: OpenStruct.new(x: 3, y: 7),
                        to: OpenStruct.new(x: 5, y: 7),
                        colour: 'I'))

      bitmap_editor.run('H 3 5 7 I')
    end
  end

  describe 'H 4 8 3 J' do
    it "paints a horizontal line from (4, 3) to (8, 3) the colour 'J'" do
      expect(image).to(receive(:paint_horizontal_line).with(
                        from: OpenStruct.new(x: 4, y: 3),
                        to: OpenStruct.new(x: 8, y: 3),
                        colour: 'J'
                      ))

      bitmap_editor.run('H 4 8 3 J')
    end
  end
end
