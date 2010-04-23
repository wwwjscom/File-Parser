require "test/unit"
require "code/space"

class TestSpace < Test::Unit::TestCase
  
  DOB    = "6-3-1975"
  LINE   = "Kournikova Anna F F 6-3-1975 Red\n"
  LINE_M = "Kournikova Anna F M 6-3-1975 Red\n"
  
  def test_parse_dob
    dob = Space.parse_dob(DOB)
    assert_equal(3, dob.day)
    assert_equal(6, dob.month)
    assert_equal(1975, dob.year)
  end
  
  def test_parse_line_female
    pl = Space.parse_line(LINE)
    
    assert_kind_of(Hash, pl)
    assert_equal("Kournikova", pl[:fn])
    assert_equal("Anna", pl[:ln])
    assert_equal("F", pl[:mi])
    assert_equal("Female", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(6, pl[:dob].month)
    assert_equal(1975, pl[:dob].year)
  end

  def test_parse_line_male
    pl = Space.parse_line(LINE_M)
    assert_equal("Male", pl[:sex])
  end

  
  def test_parse_file
    pf = Space.parse_file(File.open("input/space.txt"))
    assert_kind_of(Array, pf)
    assert_equal(3, pf.size)
    
    pl = pf[0]
    assert_kind_of(Hash, pl)
    assert_equal("Kournikova", pl[:fn])
    assert_equal("Anna", pl[:ln])
    assert_equal("F", pl[:mi])
    assert_equal("Female", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(6, pl[:dob].month)
    assert_equal(1975, pl[:dob].year)
  end
  
end