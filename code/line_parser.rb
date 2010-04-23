require "date"

module LineParser
  
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
    Date.parse("#{dob[2]}-#{dob[0]}-#{dob[1]}")
  end
end