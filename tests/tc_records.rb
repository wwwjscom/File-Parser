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
    
    @records = Records.new
    @records << Record.new(ATTRIBUTES)
    @records << Record.new(ATTRIBUTES_2)
    @records << Record.new(ATTRIBUTES_3)
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
    @records.sort_by_dob!
    assert_equal(1953, @records.get(0).dob.year)
    assert_equal(1986, @records.get(1).dob.year)
    assert_equal(1987, @records.get(2).dob.year)
  end
  
  def test_sort_by_ln
    @records.sort_by_ln!
    assert_equal("Soo", @records.get(0).ln)
    assert_equal("Corden", @records.get(1).ln)
    assert_equal("Bostwick", @records.get(2).ln)
  end
  
  def test_sort_by_sex_then_ln
    @records.sort_by_sex_then_ln!
    assert_equal("Bostwick", @records.get(0).ln)
    assert_equal("Corden", @records.get(1).ln)
    assert_equal("Soo", @records.get(2).ln)
  end
  
end