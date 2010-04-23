require "test/unit"
require "code/file_reader"

class TestFileReader < Test::Unit::TestCase
  
  def test_read_dir
    lines = FileReader.read_dir("input")
    assert_equal(9, lines.size)
  end
  
  def test_read_dir_fail
    lines = FileReader.read_dir("foo")    
    assert_nil(lines)
  end
  
end