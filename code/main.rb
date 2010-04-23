require "code/file_reader"
require "code/records"
require "code/record"

# Kick off the program.  Parses all files located inside the
# input directory and prints their contents according to the
# sorting method which is called.
class Main
  
  # Execute the program.  Sorting method is clearly defined
  # inside the case statement.
  def self.run(sorting_method, print = true)
    r = Records.new
    lines = FileReader.read_dir("input")
    
    lines.each { |l| r << Record.new(l) }
    
    case sorting_method
      when 1 then r.sort_by_sex_then_ln!
      when 2 then r.sort_by_dob!
      when 3 then r.sort_by_ln!
    end
    
    puts r.to_s if print # for testing purposes
    return r.to_s # for testing purposes again
  end
  
end