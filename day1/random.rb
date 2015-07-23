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
