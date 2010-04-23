class Record

  attr_reader :fn, :ln, :mi, :sex, :fav_color, :dob
  
  def initialize(attributes)
    @fn        = attributes[:fn]
    @ln        = attributes[:ln]
    @mi        = attributes[:mi]
    @sex       = attributes[:sex]
    @fav_color = attributes[:fav_color]
    @dob       = attributes[:dob]
  end
  
end