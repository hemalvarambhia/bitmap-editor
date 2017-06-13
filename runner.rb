$LOAD_PATH << 'lib'
require 'geometry/coordinates'
require 'image'
require 'display'
require 'bitmap_editor'
image = Image.new
display = Display.new(STDOUT)
editor =   BitmapEditor.new(image, display)
File.open(ARGV.first).each do |command|
  display.show command
  editor.run command
end
