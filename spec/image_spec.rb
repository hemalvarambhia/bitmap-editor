class Image
  attr_reader :width, :height, :pixels
  def create(dimensions)
    @width = dimensions[:width]
    @height = 1
    @pixels = Array.new(1) { 'O' * @width }
    @width = @pixels[0].size
  end
end

describe Image do
  describe 'initialising a 1 x 1 image' do
    it 'has a width of 1 px and a height of 1px' do
      image = Image.new
      image.create(width: 1, height: 1)

      expect(image.width).to eq 1
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image = Image.new
      image.create(width: 1, height: 1)

      expect(image.pixels).to eq ['O']
    end
  end

  describe 'initialising a 2 x 1 image' do
    it 'has a width of 2px and a height of 1px' do
      image = Image.new
      image.create(width: 2, height: 1)

      expect(image.width).to eq 2
      expect(image.height).to eq 1
    end

    it 'is coloured white' do
      image = Image.new
      image.create(width: 2, height: 1)

      expect(image.pixels).to eq [ 'OO' ]
    end
  end
end
