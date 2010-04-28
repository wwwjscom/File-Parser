require "code/record"
require "test/unit"

class TestRecord < Test::Unit::TestCase
  
  ATTRIBUTES = 
    { 
      :fn        => "Jason", 
      :ln        => "Soo", 
      :mi        => "K",
      :sex       => "Male", 
      :fav_color => "Blue", 
      :dob       => Date.new(1986, 8, 18)
    }  
  
  def test_crate
    r = Record.new(ATTRIBUTES)
    assert_equal(ATTRIBUTES[:fn], r.fn)
    assert_equal(ATTRIBUTES[:ln], r.ln)
    assert_equal(ATTRIBUTES[:mi], r.mi)
    assert_equal(ATTRIBUTES[:sex], r.sex)
    assert_equal(ATTRIBUTES[:fav_color], r.fav_color)
    assert_equal(ATTRIBUTES[:dob].day, r.dob.day)
    assert_equal(ATTRIBUTES[:dob].month, r.dob.month)
    assert_equal(ATTRIBUTES[:dob].year, r.dob.year)
  end
end