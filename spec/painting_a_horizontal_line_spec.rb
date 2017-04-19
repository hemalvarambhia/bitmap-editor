require 'ostruct'
require 'bitmap_editor'
describe 'Painting a horizontal line' do
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image) }
  
  describe 'H 1 1 1 I' do
    it "paints a pixel at (1, 1) the colour 'I'" do
      line = [ OpenStruct.new(x: 1, y: 1) ]
      expect(image).to(receive(:paint_line).with(line, 'I'))

      bitmap_editor.run('H 1 1 1 I')
    end
  end

  describe 'H 1 3 1 I' do
    it "paints a horizontal line from (1, 1) to (3, 1) the colour 'I'" do
      line = [
        OpenStruct.new(x: 1, y: 1), 
        OpenStruct.new(x: 2, y: 1), 
        OpenStruct.new(x: 3, y: 1) ]
      expect(image).to(
        receive(:paint_line).with(line, 'I'))

      bitmap_editor.run('H 1 3 1 I')
    end
  end

  describe 'H 3 5 1 I' do
    it "paints a horizontal line from (3, 1) to (5, 1) the colour 'I'" do
      line = [
        OpenStruct.new(x: 3, y: 1), 
        OpenStruct.new(x: 4, y: 1), 
        OpenStruct.new(x: 5, y: 1) ]
      expect(image).to receive(:paint_line).with(line, 'I')

      bitmap_editor.run('H 3 5 1 I')
    end
  end

  describe 'H 3 5 7 I' do
    it "paints a horizontal line from (3, 7) to (5, 7) the colour 'I'" do
      line = [
        OpenStruct.new(x: 3, y: 7), 
        OpenStruct.new(x: 4, y: 7), 
        OpenStruct.new(x: 5, y: 7)
      ]
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
        OpenStruct.new(x: 3, y: 2), OpenStruct.new(x: 4, y: 2), 
        OpenStruct.new(x: 5, y: 2), OpenStruct.new(x: 6, y: 2), 
        OpenStruct.new(x: 7, y: 2)      
      ]
      expect(image).to receive(:paint_line).with(line, any_args)

      bitmap_editor.run('H 7 3 2 B')
    end
  end

  describe 'H -4 1 7 C' do
    it "paints a horizontal line from (1, 7) to (4, 7)" do
      line = [
        OpenStruct.new(x: 2, y: 7),
        OpenStruct.new(x: 3, y: 7),
        OpenStruct.new(x: 4, y: 7)
      ]
      expect(image).to receive(:paint_line)
                        .with(array_including(line), any_args)


      bitmap_editor.run('H -4 1 7 C')
    end
  end

  describe 'H 3 -7 2 D' do
    it "paints a horizontal line from (3, 2) to (7, 2)" do
      pending
      expect(image).to receive(:paint_horizontal_line)
                        .with(a_hash_including(
                                from: OpenStruct.new(x: 3, y: 2),
                                to: OpenStruct.new(x: 7, y: 2))
                             )

      bitmap_editor.run('H 3 -7 2 D')
    end
  end

  describe 'H 1 2 -3 P' do
    it "paints a horizontal line from (1, 3) to (2, 3)" do
      pending
      expect(image).to receive(:paint_horizontal_line)
                        .with(a_hash_including(
                          from: OpenStruct.new(x: 1, y: 3),
                          to: OpenStruct.new(x: 2, y: 3))
                       )

      bitmap_editor.run('H 1 2 -3 P')
    end
  end

  describe 'H 2 3 4 g' do
    it "paints the horizontal line the colour G" do
      pending
      expect(image).to receive(:paint_horizontal_line)
                        .with(a_hash_including(colour: 'G'))

      bitmap_editor.run('H 2 3 4 G')
    end
  end

  describe 'h 3 6 2 h' do
    it "paints a horizontal line from (3, 2) to (6, 2) the colour 'H'" do
      pending
      expect(image).to receive(:paint_horizontal_line)
                         .with(
                           from: OpenStruct.new(x: 3, y: 2),
                           to: OpenStruct.new(x: 6, y: 2),
                           colour: 'H'
                         )

      bitmap_editor.run('h 3 6 2 h')
    end
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
