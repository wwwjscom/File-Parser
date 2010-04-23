require "code/file_reader"
require "code/records"
require "code/record"

class Main
  
  def self.run
    r = Records.new
    lines = FileReader.read_dir("input")
    lines.each do |l|
      r << Record.new(l)
    end
    r.sort_by_ln!
    puts r.to_s
  end
  
end

Main.run