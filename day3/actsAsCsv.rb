=begin
This basic class defines four methods. headers and csv_contents are simple 
accessors that return the value of instance variables. initialize initializes 
the results of the read. Most of the work happens in read. The read method opens a file, reads headings, 
and chops them into individual fields. Next, it loops over lines, placing the 
contents of each line in an array. 
=end
class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
  
  def headers
    @headers
  end
  
  def csv_contents
    @result
  end
  
  def initialize
    @result = []
    read
  end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
