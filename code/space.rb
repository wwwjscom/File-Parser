require "code/inputFile"
require "code/line_parser"

# Functions used to parse a space-delimited file
class Space < InputFile
  
  # Parse a comma DOB
  def self.parse_dob(dob)
    LineParser.dob(dob.split('-').map(&:to_i))
  end
  
  # Parse a particular line and return a hash of its contents
  def self.parse_line(line)
    ln, fn, mi, sex, dob, fav_color = line.split(' ')
    LineParser.to_h(fn, ln, mi, sex, fav_color, parse_dob(dob))
  end
  
  # Takes a file descriptor and parses its contents
  # returning them as an array of hashes
  def self.parse_file(file)
    lines = []
    while line = file.gets
      lines << parse_line(line)
    end
    lines
  end
  
end