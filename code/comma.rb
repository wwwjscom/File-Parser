require "code/inputFile"

class Comma < InputFile
  
  # Parse a comma DOB
  def self.parse_dob(dob)
    day, month, year = dob.split('/').map(&:to_i)
    { 
      :day   => day,
      :month => month,
      :year  => year
    }
  end
  
  # Parse a particular line
  def self.parse_line(line)
    fn, ln, sex, fav_color, dob = line.split(', ')
    { 
      :fn        => fn, 
      :ln        => ln, 
      :sex       => sex, 
      :fav_color => fav_color, 
      :dob       => parse_dob(dob)
    }
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
  