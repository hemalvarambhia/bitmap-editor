require 'spec_helper'
require 'geometry/coordinates'
describe 'Painting a horizontal line' do
  include Geometry::Coordinates
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image, nil) }
  
  describe 'H 1 1 1 I' do
    it "paints a pixel at (1, 1) the colour 'I'" do
      line = [ coordinate(1, 1) ]
      expect(image).to(receive(:paint_line).with(line, 'I'))

      bitmap_editor.run('H 1 1 1 I')
    end
  end

  describe 'H 1 3 1 I' do
    it "paints a horizontal line from (1, 1) to (3, 1) the colour 'I'" do
      line = [ coordinate(1, 1), coordinate(2, 1), coordinate(3, 1) ]
      expect(image).to(
        receive(:paint_line).with(line, 'I'))

      bitmap_editor.run('H 1 3 1 I')
    end
  end

  describe 'H 3 5 1 I' do
    it "paints a horizontal line from (3, 1) to (5, 1) the colour 'I'" do
      line = [ coordinate(3, 1), coordinate(4, 1), coordinate(5, 1) ]
      expect(image).to receive(:paint_line).with(line, 'I')

      bitmap_editor.run('H 3 5 1 I')
    end
  end

  describe 'H 3 5 7 I' do
    it "paints a horizontal line from (3, 7) to (5, 7) the colour 'I'" do
      line = [ coordinate(3, 7), coordinate(4, 7), coordinate(5, 7) ]
      expect(image).to receive(:paint_line).with(line, 'I')

      bitmap_editor.run('H 3 5 7 I')
    end
  end

  describe 'H 4 8 3 J' do
    it "paints a horizontal line from (4, 3) to (8, 3) the colour 'J'" do
      expect(image).to receive(:paint_line).with(any_args, 'J')

      bitmap_editor.run('H 4 8 3 J')
    end
  end

  describe 'H 7 3 2 B' do
    it "paints a horizontal line from (3, 2) to (7, 2)" do
      line = [
        coordinate(3, 2), coordinate(4, 2), coordinate(5, 2), coordinate(6, 2), 
        coordinate(7, 2)      
      ]
      expect(image).to receive(:paint_line).with(line, any_args)

      bitmap_editor.run('H 7 3 2 B')
    end
  end

  describe 'H -4 1 7 C' do
    it "paints a horizontal line from (1, 7) to (4, 7)" do
      line = [
        coordinate(2, 7),
        coordinate(3, 7),
        coordinate(4, 7)
      ]
      expect(image).to receive(:paint_line)
                        .with(array_including(line), any_args)


      bitmap_editor.run('H -4 1 7 C')
    end
  end

  describe 'H 3 -7 2 D' do
    it "paints a horizontal line from (3, 2) to (7, 2)" do
      expect(image)
        .to receive(:paint_line)
             .with(array_including(coordinate(7, 2)), any_args)

      bitmap_editor.run('H 3 -7 2 D')
    end
  end

  describe 'H 1 2 -3 P' do
    it "paints a horizontal line from (1, 3) to (2, 3)" do
      line = [ coordinate(1, 3), coordinate(2, 3) ]
      expect(image).to(
        receive(:paint_line).with(array_including(line), any_args))

      bitmap_editor.run('H 1 2 -3 P')
    end
  end

  describe 'H 2 3 4 g' do
    it "paints the horizontal line the colour G" do
      expect(image).to receive(:paint_line).with(any_args, 'G')

      bitmap_editor.run('H 2 3 4 g')
    end
  end

  describe 'h 3 6 2 h' do
    it "paints a horizontal line from (3, 2) to (6, 2) the colour 'H'" do
      expect(image).to receive(:paint_line)

      bitmap_editor.run('h 3 6 2 h')
    end
  end 

  describe 'H' do
    it 'raises an invalid command error'
  end

  describe 'H 1' do
    it 'raises an invalid command error'
  end

  describe 'H 3 4' do
    it 'raises an invalid command error'
  end

  describe 'H 2 4 10' do
    it 'raises an invalid command error'
  end

  describe 'H 6 7 10 1' do
    it 'raises an invalid command error'
  end

  describe 'H 1 251 4 A' do
    it 'paints a horizontal line from (1, 4) to (251, 4)'
  end

  describe 'H 0 10 3 Z' do
    it 'paints a horizontal line form (0, 3) to (10, 3)'
  end

  describe 'H 1 2 3 4' do
    it 'paints a horizontal line the colour 4'
  end
end
