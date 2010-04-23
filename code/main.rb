require "code/file_reader"
require "code/records"
require "code/record"

class Main
  
  def self.run(sorting_method)
    r = Records.new
    lines = FileReader.read_dir("input")
    
    lines.each do |l|
      r << Record.new(l)
    end
    
    case sorting_method
      when 1 then r.sort_by_sex_then_ln!
      when 2 then r.sort_by_dob!
      when 3 then r.sort_by_ln!
    end
    
    puts r.to_s
  end
  
end