require "date"

# This module helps the parser classes (classes that are children of InputFile)
module LineParser
  
  # Converts a list of attributes into a hash while
  # doing some nice conversions for printing pleasure
  def self.to_h(fn, ln, mi, sex, fav_color, dob)
    { 
      :fn        => fn, 
      :ln        => ln, 
      :mi        => mi,
      :sex       => (sex =~ /^M[ale]?/) ? "Male" : "Female", 
      :fav_color => fav_color, 
      :dob       => dob
    }
  end
  
  # Converts an array into a Date object
  def self.dob(dob)
    #yyyy-mm-dd
    Date.new(dob[2], dob[0], dob[1])
  end
end