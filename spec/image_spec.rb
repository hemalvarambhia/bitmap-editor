class Image
  attr_reader :width, :height, :pixels
  def create(dimensions)
    @width = dimensions[:width]
    @height = dimensions[:height]
    @pixels = Array.new(@height) { 'O' * @width }
    @width = @pixels[0].size
  end
end

describe Image do
  let(:image) { Image.new }
  describe 'initialising a 1 x 1 image' do
    it 'has a width of 1 px and a height of 1px' do
      image.create(width: 1, height: 1)

      expect(image.width).to eq 1
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image.create(width: 1, height: 1)

      expect(image.pixels).to eq ['O']
    end
  end

  describe 'initialising a 2 x 1 image' do
    it 'has a width of 2px and a height of 1px' do
      image.create(width: 2, height: 1)

      expect(image.width).to eq 2
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image.create(width: 2, height: 1)

      expect(image.pixels).to eq [ 'OO' ]
    end
  end

  describe 'initialising a 2 x 3 image' do
    it 'has a width of 2px and a height of 3px' do
      image.create(width: 2, height: 3)

      expect(image.width).to eq 2
      expect(image.height).to eq 3
    end

    it 'is painted white' do
      image.create(width: 2, height: 3)

      expect(image.pixels).to eq ['OO', 'OO', 'OO']
    end
  end
end
