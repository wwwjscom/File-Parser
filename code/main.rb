require "code/file_reader"
require "code/records"

class Main
  
  def self.run
    r = Records.new
    lines = FileReader.read_dir("input")
    lines.each do |l|
      r << Record.new(l)
    end
    r.to_s
  end
  
end