describe 'Displaying an image' do
  class Display
    def initialize(terminal)
      @terminal = terminal
    end

    def show(image)
      @terminal.puts(image.to_s)
    end
  end

  it 'displays the image' do
    image = double(:image, to_s: "OOO\nOOO\nOOO")
    terminal = StringIO.new

    Display.new(terminal).show(image)

    expect(terminal.string).to eq "OOO\nOOO\nOOO\n"
  end

  it 'displays any image' do
    image = double(:image, to_s: "OO\nOO\nOO\nOO")
    terminal = StringIO.new
    Display.new(terminal).show(image)

    expect(terminal.string).to eq "OO\nOO\nOO\nOO\n"
  end
end
