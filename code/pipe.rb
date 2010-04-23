require "code/inputFile"
require "code/line_parser"

class Pipe < InputFile

  # Not DRY: Space::parse_dob
  def self.parse_dob(dob)
    LineParser.dob(dob.split('-').map(&:to_i))
  end

  def self.parse_line(line)
    ln, fn, mi, sex, fav_color, dob = line.split(' | ')
    LineParser.to_h(fn, ln, mi, sex, fav_color, parse_dob(dob))
  end
  
  # Takes a file object and parses its contents
  # returning them as an array of hashes
  def self.parse_file(file)
    lines = []
    while line = file.gets
      lines << parse_line(line)
    end
    lines
  end
  
end