class Grep
	attr_accessor :filename, :searchString
	def initialize(filename, searchString)
		@filename = filename
		@searchString = searchString
		search(searchString)
	end

	def search (searchString)
		lineNumber=0
		File.open(filename,"r") do |myFile|
			while (line = myFile.gets)
				#if line.include? searchString
				regex='/'+searchString+'/'
				if line =~ /line/
					puts "line number #{lineNumber} - #{line}"
				end
				lineNumber = lineNumber + 1

			end
		end
	end
end


myGrep = Grep.new 'myFile.txt','lin'
