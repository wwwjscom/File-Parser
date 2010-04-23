require "test/unit"
require "code/comma"

class TestComma < Test::Unit::TestCase
  
  DOB  = "1/2/2001"
  LINE = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
  
  def setup
    @c = Comma.new
  end
  
  def test_parse_dob
    dob = @c.parse_dob(DOB)
    assert_equal(2, dob.day)
    assert_equal(1, dob.month)
    assert_equal(2001, dob.year)
  end
  
  def test_parse_line
    pl = @c.parse_line(LINE)
    assert_instance_of(Hash, pl)
    assert_equal("Neil", pl[:fn])
    assert_equal("Abercrombie", pl[:ln])
    assert_equal("Male", pl[:sex])
    assert_equal("Tan", pl[:fav_color])
    assert_equal(13, pl[:dob].day)
    assert_equal(2, pl[:dob].month)
    assert_equal(1943, pl[:dob].year)
  end
  
end