class InputFile
	
	def initialize(file_name)
		begin
			@file = File.open("input/" + file_name)
		rescue
			raise "File not found"
		end
	end

	# Determines the type of deliminted file we're dealing with
	# and returns that type as a symbol
	def file_type
		line = @file.gets
				
		type = case line[line.rindex(' ')-1].chr
			when ',' then :comma
			when '|' then :pipe
			else :space
		end
	end
	
end