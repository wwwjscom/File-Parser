require "test/unit"
require "code/main"

class TestMain < Test::Unit::TestCase
  
  def test_output_1
    output = Main.run(1, false)
    desired_output = 
%{Hingis Martina Female 4/2/1979 Green
Kelly Sue Female 7/12/1959 Pink
Kournikova Anna Female 6/3/1975 Red
Seles Monica Female 12/2/1973 Black
Abercrombie Neil Male 2/13/1943 Tan
Bishop Timothy Male 4/23/1967 Yellow
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Steve Smith Male 3/3/1985 Red
}.gsub(/ +/, ' ')
    assert_equal(desired_output, output)
  end

  def test_output_2
    output = Main.run(2, false)
    desired_output = 
%{Abercrombie Neil Male 2/13/1943 Tan
Kelly Sue Female 7/12/1959 Pink
Bishop Timothy Male 4/23/1967 Yellow
Seles Monica Female 12/2/1973 Black
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Kournikova Anna Female 6/3/1975 Red
Hingis Martina Female 4/2/1979 Green
Steve Smith Male 3/3/1985 Red
}.gsub(/ +/, ' ')
    assert_equal(desired_output, output)
  end

  def test_output_3
    output = Main.run(3, false)
    desired_output = 
%{Steve Smith Male 3/3/1985 Red
Seles Monica Female 12/2/1973 Black
Kournikova Anna Female 6/3/1975 Red
Kelly Sue Female 7/12/1959 Pink
Hingis Martina Female 4/2/1979 Green
Bouillon Francis Male 6/3/1975 Blue
Bonk Radek Male 6/3/1975 Green
Bishop Timothy Male 4/23/1967 Yellow
Abercrombie Neil Male 2/13/1943 Tan
}.gsub(/ +/, ' ')
    assert_equal(desired_output, output)
  end

  
end