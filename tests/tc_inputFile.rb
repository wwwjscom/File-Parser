require "test/unit"
require "code/inputFile"

class TestInputFile < Test::Unit::TestCase
	
	def setup
 	 @if_c = InputFile.new("input/comma.txt")
	 @if_p = InputFile.new("input/pipe.txt")
	 @if_s = InputFile.new("input/space.txt")
	end
	
	def test_file_opening
		assert_nothing_raised(RuntimeError) { @if_c }
		assert_nothing_raised(RuntimeError) { @if_p }
		assert_nothing_raised(RuntimeError) { @if_s }
	end

	def test_file_missing
		assert_raise(RuntimeError) { InputFile.new("input/im_missing.txt") }
	end
	
	def test_file_type
		assert_equal(:comma, @if_c.file_type)
		assert_equal(:space, @if_s.file_type)
		assert_equal(:pipe,  @if_p.file_type)
	end
	
	def test_parse_space_file
	  pf = @if_s.parse_file(Space.new)
    assert_kind_of(Array, pf)
    assert_equal(3, pf.size)
    
    pl = pf[0]
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
  
  
  def test_parse_comma_file
    pf = @if_c.parse_file(Comma.new)
    assert_instance_of(Array, pf)
    assert_equal(3, pf.size)
    
    pl = pf[0]
    assert_instance_of(Hash, pl)
    assert_equal("Neil", pl[:fn])
    assert_equal("Abercrombie", pl[:ln])
    assert_equal("Male", pl[:sex])
    assert_equal("Tan", pl[:fav_color])
    assert_equal(13, pl[:dob].day)
    assert_equal(2, pl[:dob].month)
    assert_equal(1943, pl[:dob].year)
  end
  
  def test_parse_pipe_file
    pf = @if_p.parse_file(Pipe.new)
    assert_kind_of(Array, pf)
    assert_equal(3, pf.size)
    
    pl = pf[0]
    assert_equal("Steve", pl[:ln])
    assert_equal("Smith", pl[:fn])
    assert_equal("D", pl[:mi])
    assert_equal("Male", pl[:sex])
    assert_equal("Red", pl[:fav_color])
    assert_equal(3, pl[:dob].day)
    assert_equal(3, pl[:dob].month)
    assert_equal(1985, pl[:dob].year)
  end
	
end