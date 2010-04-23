require "test/unit"
require "code/space"

class TestSpace < Test::Unit::TestCase
  
  DOB    = "6-3-1975"
  LINE   = "Kournikova Anna F F 6-3-1975 Red\n"
  LINE_M = "Kournikova Anna F M 6-3-1975 Red\n"

  def setup
    @s = Space.new
  end
  
  def test_parse_dob
    dob = @s.parse_dob(DOB)
    assert_equal(3, dob.day)
    assert_equal(6, dob.month)
    assert_equal(1975, dob.year)
  end
  
  def test_parse_line_female
    pl = @s.parse_line(LINE)
    
    assert_kind_of(Hash, pl)
    assert_equal("Anna", pl[:fn])
    assert_equal("Kournikova", pl[:ln])
    assert_equal("F", pl[:mi])
    assert_equal("Female", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(6, pl[:dob].month)
    assert_equal(1975, pl[:dob].year)
  end

  def test_parse_line_male
    pl = @s.parse_line(LINE_M)
    assert_equal("Male", pl[:sex])
  end
  
end