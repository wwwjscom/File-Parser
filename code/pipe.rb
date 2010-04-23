require "code/inputFile"
require "code/line_parser"

# Functions used to parse a pipe-delimited file
class Pipe < InputFile

  def initialize
  end
  
  # Parse a comma DOB
  def parse_dob(dob)
    LineParser.dob(dob.split('-').map(&:to_i))
  end

  # Parse a particular line and return a hash of its contents
  def parse_line(line)
    ln, fn, mi, sex, fav_color, dob = line.split(' | ')
    LineParser.to_h(fn, ln, mi, sex, fav_color, parse_dob(dob))
  end
  
end