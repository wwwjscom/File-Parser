# The parent of all parsing classes.  This class mainly prepares
# for parsing and determines file formats so we can call the
# appropriate parser.
class InputFile
	
	attr_reader :file_desc
	
  # Ensures the file can be found and read then sets up the
  # file descriptor so it can be accessed later.
	def initialize(file_path)
		begin
			@file_desc = File.open(file_path)
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
	
	# Close up the file
	def close
	 @file_desc.close
	end
	
end