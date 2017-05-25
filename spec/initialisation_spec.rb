require 'spec_helper'
describe 'Initialisation command' do
  let(:image) { double(:image) }
  let(:bitmap_editor) { BitmapEditor.new(image, nil) }

  describe 'I 1 1' do
    it 'creates a 1 x 1 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 1, height: 1)
      
      bitmap_editor.run('I 1 1')
    end
  end

  describe 'I 2 1' do
    it 'creates a 2 x 1 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 2, height: 1)

      bitmap_editor.run('I 2 1')
    end
  end

  describe 'I 3 4' do
    it 'creates a 3 x 4 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 3, height: 4)

      bitmap_editor.run('I 3 4')
    end
  end

  describe 'I 5 2' do
    it 'creates a 5 x 2 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 5, height: 2)

      bitmap_editor.run('I 5 2')
    end
  end

  describe 'I -6 10' do
    it 'creates a 6 x 10 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 6, height: 10)

      bitmap_editor.run('I -6 10')
    end
  end

  describe 'I 3 -9' do
    it 'creates a 3 x 9 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 3, height: 9)

      bitmap_editor.run('I 3 -9')
    end
  end

  describe 'i 4 4' do
    it 'creates a 4 x 4 image with all pixels painted white' do
      expect(image).to receive(:create).with(width: 4, height: 4)

      bitmap_editor.run('i 4 4')
    end
  end

  describe 'I' do
    it 'raises an invalid command error'
  end

  describe 'I 1' do
    it 'raises an invalid command error'
  end

  describe 'I 0 0' do
    it 'raises an invalid command error'
  end

  describe 'I 270 270' do
    it 'raises an invalid command error'
  end
end
