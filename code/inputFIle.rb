class InputFile
	
	attr_reader :file_desc
	
	# Pretty sure this function isn't needed
	def initialize(file_name)
		begin
			@file_desc = File.open(file_name)
		rescue
			raise "File not found"
		end
	end

	# Determines the type of deliminted file we're dealing with
	# and returns that type as a symbol
	def file_type
		line = @file_desc.gets
		@file_desc.pos = 0 # Reset our location within the file
		
				
		type = case line[line.rindex(' ')-1].chr
			when ',' then :comma
			when '|' then :pipe
			else :space
		end
	end
	
	def close
	 @file_desc.close
	end
	
end