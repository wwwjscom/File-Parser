require "test/unit"
require "code/comma"

class TestComma < Test::Unit::TestCase
  
  DOB  = "1/2/2001"
  LINE = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
  
  def test_parse_dob
    dob = Comma.parse_dob(DOB)
    assert_equal(1, dob[:day])
    assert_equal(2, dob[:month])
    assert_equal(2001, dob[:year])
  end
  
  def test_parse_line
    pl = Comma.parse_line(LINE)
    assert_instance_of(Hash, pl)
    assert_equal("Abercrombie", pl[:fn])
    assert_equal("Neil", pl[:ln])
    assert_equal("Male", pl[:sex])
    assert_equal("Tan", pl[:fav_color])
    assert_equal(2, pl[:dob][:day])
    assert_equal(13, pl[:dob][:month])
    assert_equal(1943, pl[:dob][:year])
  end
  
  def test_parse_file
    pf = Comma.parse_file(File.open("input/comma.txt"))
    assert_instance_of(Array, pf)
    assert_equal(3, pf.size)
    
    pl = pf[0]
    assert_instance_of(Hash, pl)
    assert_equal("Abercrombie", pl[:fn])
    assert_equal("Neil", pl[:ln])
    assert_equal("Male", pl[:sex])
    assert_equal("Tan", pl[:fav_color])
    assert_equal(2, pl[:dob][:day])
    assert_equal(13, pl[:dob][:month])
    assert_equal(1943, pl[:dob][:year])
  end
  
end