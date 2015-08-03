# Ruby - 7 langauges in 7 days

## Day 1
Find…

The Ruby API [here](http://ruby-doc.org/core-2.2.2/)

• The free online version of [Programming Ruby: The Pragmatic Programmer’s
Guide](http://ruby-doc.com/docs/ProgrammingRuby/)

• A method that substitutes part of a string
```ruby
myString = "Welcome to JavaScript!"
myString["JavaScript"]= "Ruby"
puts myString
=> "Welcome to Ruby!"
```
• Information about Ruby’s regular expressions [here](http://ruby-doc.org/core-2.1.1/Regexp.html)

• Information about Ruby’s ranges [here](http://ruby-doc.org/core-2.2.0/Range.html)


• Print the string “Hello, world.” 
```ruby
puts ‘Hello, world.”
```

• For the string “Hello, Ruby,” find the index of the word “Ruby.” 
```ruby
'hello ruby'.index('ruby')
```
• Print your name ten times. 
```ruby
i=0
while i<10
i=i+1
puts 'derek'
end
```
• Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10. 
```ruby
i=0
irb(main):042:0> while i<10
irb(main):043:1> i=i+1
irb(main):044:1> puts "sentence #{i}"
irb(main):045:1> end
```
• Run a Ruby program from a file. 
create a file called prog.rb with this content
```ruby
i=0
while i<10
i=i+1
puts 'derek'
end
```
on the command line, ruby prog.rb

• Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high. (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)

```ruby
randomNumber=rand(10)
guessAgain=true

while guessAgain
  puts 'guess a number between 1 and 10'
  playerGuess=gets

  if playerGuess.to_i==randomNumber
    puts 'that\'s right!'
    guessAgain=false
  end
  if playerGuess.to_i>randomNumber
    puts 'ooh... too high... try again'
  end
  if playerGuess.to_i<randomNumber
    puts 'ooh... too low... try again'
  end

end
```
## Day 2
Find:
            
-Find out how to access files with and without code blocks. What is the benefit of the code block? 

Here is how you create and write to a file without a code block...
```ruby
newFile = File.open("myfile.txt","w")
newFile << 'some text'
newFile.close
```
...now with a code block...
```ruby
newFile = File.open("myfile2","w") do |f|
        f << "some text"
end
```
One benefit of the code block is that we do not have to explicitly close the file. It will automatically close the file when it exits the block.

-How would you translate a hash to an array?  Use to_a method...
```ruby
{1=>"value"}.to_a.class
=> Array
```
Can you translate arrays to hashes? Yes. Use the * splat operator.
```ruby
a=[1,2,3,4]
=> [1, 2, 3, 4]
h=Hash[*a]
=> {1=>2, 3=>4}
```

-Can you iterate through a hash? Yes...
```ruby
{“name”=>”derek”}.each do |key, value|
  puts key
  puts value
end
```
-You can use Ruby arrays as stacks. What other common data structures do arrays support?  
Use push and pop for the array to act as a stack.
```ruby
irb(main):004:0> a
=> [1, 2, 3, 4]
irb(main):005:0> a.push(5)
=> [1, 2, 3, 4, 5]
irb(main):006:0> a.pop
=> 5
```
Also a[-1] acts like a peek operation
```ruby
irb(main):008:0> a
=> [1, 2, 3, 4]
irb(main):009:0> a[-1]
=> 4
```
Arrays can also acts like queues. Use the shift method to remove the first element in the queue. You can peek at the top of the queue using first or [0]
```ruby
a
=> [1, 2, 3, 4]
irb(main):012:0> a.shift
=> 1
irb(main):013:0> a
=> [2, 3, 4]
irb(main):014:0> a.first
=> 2
irb(main):016:0> a[0]
=> 2
```

-Print the contents of an array of sixteen numbers, four numbers at a time, using just each. THIS FEELS LIKE A CHEAT.

each implementation
```ruby
myStack=[]
(1..16).each {|a|
  myStack.push(a)
  if (myStack.length ==4)
    puts myStack.join(",")
    myStack=[]
  end
}
```
Now, do the same with each_slice in Enumerable.
```ruby
(1..16).each_slice(4) {|a| p a}
[1, 2, 3, 4]
[5, 6, 7, 8]
[9, 10, 11, 12]
[13, 14, 15, 16]
=> nil
```

p is like puts, but it does not insert a line feed.
p foo does puts foo.inspect, i.e. it prints the value of inspect instead of to_s, which is more suitable for debugging (because you can e.g. tell the difference between 1, "1" and "2\b1", which you can't when printing without inspect).                           

-The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

```ruby
class Tree
    attr_accessor :child_nodes, :name
  def initialize(treeData)
    puts "tree size= #{treeData.size}"
=begin
    save current node value to @name
=end  
    @name=treeData.keys()[0]
    puts "adding key-value pair #{@name}"
=begin
    create empty array to hold this name's children
=end  

    @child_nodes=[]
=begin
    go to each of this node's children and add it to the children array.
    For each child create a new Tree object. This will call Tree.initialize
    which will recursively descend the tree
=end  
    treeData[@name].each {|key,value|
      @child_nodes.push(
        Tree.new( key => value)
      )

    puts "#{@name} size= #{@child_nodes.size}"
    }

  end

  def visit_all(&block)
    visit &block
    child_nodes.each {|c| c.visit_all &block}
  end

  def visit(&block) 
    block.call self
  end 
end

puts "*************************************************"
puts "simple tree"
simple_tree = Tree.new({"dad" => {"son" => {}}})

puts "*************************************************"
puts "complex tree"
ruby_tree = Tree.new({
 "grandpa" => {
            "dad" => {
                "child1" => {},
                "child2" => {}
            },
            "uncle" => {
                "child3" => {},
                "child4" => {}
            }
        }

  })

puts 'visiting node'
ruby_tree.visit {|node| puts node.name}

puts 'visiting all nodes'
ruby_tree.visit_all {|node| puts node.name}
```
                              
-Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers. 
NOTE - I did not need to use regex pattern matching.
```ruby
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
```
## Day 3
## Homework
Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that CsvRow to return the value for the column for a given heading.
For example, for the file:
      one, two
      lions, tigers
allow an API that works like this:
      csv = RubyCsv.new
      csv.each {|row| puts row.one}
This should print "lions".

```ruby
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

```
note: when specifying method_missing, it is advisable to specify respond_to? method first.

The index method is pretty neat. It works on arrays like so...
```ruby
irb(main):009:0> a=["one","two"]
=> ["one", "two"]
irb(main):010:0> a.index("one")
=> 0
irb(main):011:0> a.index("two")
=> 1
```
# Unit Testing Framework
Use Minitest
refer to examples in unitTest folder
To run a test...
uby test_stack.rb
Run options: --seed 3150

#Running tests:

...

Finished tests in 0.000583s, 5145.7976 tests/s, 5145.7976 assertions/s.

3 tests, 3 assertions, 0 failures, 0 errors, 0 skips
dereks-MacBook-Pro:unitTest work$ vi test_stack.rb
dereks-MacBook-Pro:unitTest work$ vi expectation_style.rb
dereks-MacBook-Pro:unitTest work$ vi expectation_style.rb
dereks-MacBook-Pro:unitTest work$ vi test_stack.rb
dereks-MacBook-Pro:unitTest work$ ruby test_stack.rb
Run options: --seed 64986

#Running tests:

........

Finished tests in 0.001448s, 5524.8619 tests/s, 6906.0773 assertions/s.

8 tests, 10 assertions, 0 failures, 0 errors, 0 skips