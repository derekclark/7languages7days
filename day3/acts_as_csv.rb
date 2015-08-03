=begin
The next step is to take the file and attach that behavior 
to a class with a module method often called a macro. Macros change 
the behavior of classes, often based on changes in the environment.
In this case, our macro opens up the class and dumps in all the 
behavior related to a CSV file:

The metaprogramming happens in the acts_as_csv macro. That code calls 
define_method for all the methods we want to add to the target class. 
Now, when the target class calls acts_as_csv, that code will define all four methods on the target class.
So, the acts_as macro code does nothing but add a few methods we could have 
easily added through inheritance. That design does not seem like much of an improvement, 
but it’s about to get more inter- esting. 
=end
class ActsAsCsv
  def self.acts_as_csv
    
    define_method 'read' do
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
    
    define_method "headers" do
      @headers
    end
    
    define_method "csv_contents" do
      @result
    end
    
    define_method 'initialize' do
      @result = []
      read
    end
  end
end

class RubyCsv < ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
