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
##Day 2
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
              
                              
-Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers. 
