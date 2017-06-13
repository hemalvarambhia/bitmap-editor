$LOAD_PATH << 'lib'
require 'geometry/coordinates'
require 'image'
require 'display'
require 'bitmap_editor'
image = Image.new
display = Display.new(STDOUT)
File.open(ARGV.first).each do |command|
  display.show command
  BitmapEditor.new(image, display).run command
end
