require "test/unit"
require "code/inputFile"

class TestInputFile < Test::Unit::TestCase
	
	def test_file_opening
		assert_nothing_raised(RuntimeError) { @f = InputFile.new("comma.txt") }
	end

	def test_file_missing
		assert_raise(RuntimeError) { InputFile.new("im_missing.txt") }
	end
	
	def test_file_type
		assert_equal(:comma, InputFile.new("comma.txt").file_type)
		assert_equal(:space, InputFile.new("space.txt").file_type)
		assert_equal(:pipe,  InputFile.new("pipe.txt" ).file_type)
	end
	
end