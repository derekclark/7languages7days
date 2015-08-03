class Roman
  def self.method_missing name, *args
    roman = name.to_s
    #gsub replaces IV for IIII
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")

    #inspects the roman string and counts the number of V occurrences
    #and multiplies it by 5, then counts the number of Xs and multiplies
    #it by 10 and so on...
    (roman.count("I") +  
     roman.count("V") * 5 +
     roman.count("X") * 10 + 
     roman.count("L") * 50 +
     roman.count("C") * 100)
  end
end

puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.X