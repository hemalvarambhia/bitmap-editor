class Image
  attr_reader :width, :height, :pixels
  def create(dimensions)
    @width = 1
    @height = 1
    @pixels = ['O']
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
end
