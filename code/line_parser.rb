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
  
  def self.dob_to_h(dob_array)
    { 
      :day   => dob_array[0],
      :month => dob_array[1],
      :year  => dob_array[2]
    }
  end
end