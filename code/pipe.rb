require "code/inputFile"

class Pipe < InputFile
  
  def self.parse_dob(dob)
    day, month, year = dob.split('-').map(&:to_i)
    {
      :day   => day,
      :month => month,
      :year  => year
    }
  end

  def self.parse_line(line)
    ln, fn, mi, sex, fav_color, dob = line.split(' | ')
    {
      :ln => ln,
      :fn => fn,
      :mi => mi,
      :sex => (sex == "M") ? "Male" : "Female",
      :fav_color => fav_color,
      :dob => parse_dob(dob)
    }
  end
  
end