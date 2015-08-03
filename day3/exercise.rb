module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    attr_accessor :headers, :csv_contents

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      @file = File.new(filename)
      @headers = @file.gets.chomp.split(', ')
      @file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end
    
    def initialize
      read 
    end

    def each
      @csv_contents.each {|row| yield row}
    end

    class CsvRow
      def initialize(headers, row)
        @headers=headers
        @row = row
      end

      def respond_to?(sym, include_private=false)
        puts "checking if CsvRow responds to method #{sym.to_s}"
        @headers.index(sym.to_s) || super(sym)
      end

      def method_missing name, *args, &block
        sym=name.to_s
        if self.respond_to?(sym)
          col=@headers.index(sym)
          @row[col]
        else
          puts "does not respond to method: #{sym}"
        end
      end
    end


  end
end


class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts "check that each returns CsvRow"
m.each {|row| puts row.inspect}
puts
puts "check that CsvRow responds to method two"
m.each {|row| puts row.respond_to?("two")}
puts
puts "get column one"
m.each {|row| puts row.one}
puts
puts "get column two"
m.each {|row| puts row.two}
puts
puts "get non-existent column three. This will fail nicely because method_missing will first check that the object responds to the method."
m.each {|row| puts row.three}
