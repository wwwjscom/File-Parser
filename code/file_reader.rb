require "code/inputFile"
require "code/comma"
require "code/pipe"
require "code/space"

# This class interfaces with InputFile and its children to provide an
# easier way to read various formatted files.
class FileReader

  # Reads all files within a specific directory
  # and returns a 1D array of hashes of the lines.
  def self.read_dir(dir)
    lines = []
    # Iterate over all files in the given dir
    Dir[dir + "/*"].each do |f|
      lines << parse_a_file(f)
    end
    lines.flatten!
  end
  
  private #-------------
  
  # Given a file path, determines the file's type, 
  # parses and returns an array of lines
  def self.parse_a_file(file_path)
    input_file = InputFile.new(file_path)
    l = case input_file.file_type
      when :comma then input_file.parse_file(Comma.new)
      when :space then input_file.parse_file(Space.new)
      when :pipe  then input_file.parse_file(Pipe.new)
    end
    input_file.close
    l
  end
  
end