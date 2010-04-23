require "code/records"

class TestRecords < Test::Unit::TestCase
  
  ATTRIBUTES = 
    { 
      :fn        => "Jason", 
      :ln        => "Soo", 
      :mi        => "K",
      :sex       => "Male", 
      :fav_color => "Blue", 
      :dob       =>
      {
        :day   => 8,
        :month => 18,
        :year  => 1986
      }
    }
  
  def setup
    @r = Records.new
  end
  
  def test_push
    @r << Record.new(ATTRIBUTES)
    assert_equal(1, @r.size)
  end
  
  def test_push_nonrecord
    assert_raise(RuntimeError) { @r << "fail" }
    assert_equal(0, @r.size)
  end
end