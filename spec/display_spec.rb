describe 'Displaying an image' do
  class Display
    def initialize(terminal)
      @terminal = terminal
    end

    def show(image)
      @terminal.puts(image)
    end
  end

  let(:terminal) { StringIO.new }
  let(:display) { Display.new(terminal) }

  it 'displays the image' do
    image = double(:image, to_s: "OOO\nOOO\nOOO")

    display.show(image)

    expect(terminal.string).to eq "OOO\nOOO\nOOO\n"
  end

  it 'displays any image' do
    image = double(:image, to_s: "OO\nOO\nOO\nOO")

    display.show(image)

    expect(terminal.string).to eq "OO\nOO\nOO\nOO\n"
  end
end
