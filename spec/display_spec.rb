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
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with "OOO\nOOO\nOOO" 

    Display.new(terminal).show(image)
  end
end