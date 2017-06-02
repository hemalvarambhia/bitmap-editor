class Display
  def initialize(terminal)
    @terminal = terminal
  end

  def show(image)
    @terminal.puts(image)
  end
end
