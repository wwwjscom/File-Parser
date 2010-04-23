require "code/inputFile"
require "code/line_parser"

# Functions used to parse a comma-delimited file
class Comma < InputFile
  
  # Parse a comma DOB
  def self.parse_dob(dob)
    LineParser.dob(dob.split('/').map(&:to_i))
  end
    
  # Parse a particular line and return a hash of its contents
  def self.parse_line(line)
    ln, fn, sex, fav_color, dob = line.split(', ')
    LineParser.to_h(fn, ln, nil, sex, fav_color, parse_dob(dob))
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
  