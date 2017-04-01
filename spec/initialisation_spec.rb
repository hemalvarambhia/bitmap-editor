describe 'Initialisation command' do
  class BitmapEditor
    def initialize(image)
      @image = image
    end

    def run(command)
      width = command.split(' ')[1].to_i
      height = command.split(' ')[2].to_i
      @image.create(width: width, height: height)
    end
  end

  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image) }
  describe 'I 0 0' do
    it 'creates a 0 x 0 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 0, height: 0)

      bitmap_editor.run('I 0 0')
    end
  end

  describe 'I 1 0' do
    it 'creates a 1 x 0 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 1, height: 0)

      bitmap_editor.run('I 1 0')
    end
  end

  describe 'I 0 1' do
    it 'creates a 0 x 1 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 0, height: 1)

      bitmap_editor.run('I 0 1')
    end
  end

  describe 'I 5 2' do
    it 'creates a 5 x 2 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 5, height: 2)

      bitmap_editor.run('I 5 2')
    end
  end

  describe 'I 4 7' do
    it 'creates a 4 x 7 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 4, height: 7)

      bitmap_editor.run('I 4 7')
    end
  end

  describe 'I 8 8' do
    it 'creates a 8 x 8 image with all pixels painted white'
  end
end
