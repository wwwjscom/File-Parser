require "code/records"

class TestRecords < Test::Unit::TestCase
  
  ATTRIBUTES = 
    { 
      :fn        => "Jason", 
      :ln        => "Soo", 
      :mi        => "J",
      :sex       => "Male", 
      :fav_color => "Blue", 
      :dob       => Date.new(1986, 8, 18)
    }
    
    ATTRIBUTES_2 = 
      { 
        :fn        => "Alayna", 
        :ln        => "Corden", 
        :mi        => "C",
        :sex       => "Female", 
        :fav_color => "Green", 
        :dob       => Date.new(1987, 11, 4)
      }
      
      ATTRIBUTES_3 = 
        { 
          :fn        => "Pat", 
          :ln        => "Bostwick", 
          :mi        => "L",
          :sex       => "Female", 
          :fav_color => "Red", 
          :dob       => Date.new(1953, 1, 4)
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
  
  def test_sort_by_dob
    @r << Record.new(ATTRIBUTES)
    @r << Record.new(ATTRIBUTES_2)
    @r << Record.new(ATTRIBUTES_3)
    @r.sort_by_dob
    assert_equal(1953, @r.get(0).dob.year)
    assert_equal(1986, @r.get(1).dob.year)
    assert_equal(1987, @r.get(2).dob.year)
  end
end