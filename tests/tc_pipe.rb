require "test/unit"
require "code/pipe"

class TestPipe < Test::Unit::TestCase
  
  DOB    = "3-3-1985"
  LINE   = "Steve | Smith | D | M | Red | 3-3-1985\n"
  LINE_F = "Steve | Smith | D | F | Red | 3-3-1985\n"
  
  def setup
    @p = Pipe.new
  end
  
  def test_parse_dob
    dob = @p.parse_dob(DOB)
    assert_equal(3, dob.day)
    assert_equal(3, dob.month)
    assert_equal(1985, dob.year)  
  end
  
  # Test a male line
  def test_parse_line_male
    pl = @p.parse_line(LINE)
    assert_kind_of(Hash, pl)
    
    assert_equal("Steve", pl[:ln])
    assert_equal("Smith", pl[:fn])
    assert_equal("D", pl[:mi])
    assert_equal("Male", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(3, pl[:dob].month)
    assert_equal(1985, pl[:dob].year)
  end

  # Test a female line
  def test_parse_line_female
    pl = @p.parse_line(LINE_F)
    assert_kind_of(Hash, pl)
    
    assert_equal("Steve", pl[:ln])
    assert_equal("Smith", pl[:fn])
    assert_equal("D", pl[:mi])
    assert_equal("Female", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(3, pl[:dob].month)
    assert_equal(1985, pl[:dob].year)
  end
  
end