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


