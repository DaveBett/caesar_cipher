def caesar_cipher(string, modifier)
  #takes in a string and the shift factor and then outputs the modified string using a right shift
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", 
  "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  cryptid = Array.new
  key = modifier.to_i

  #reduces number of loops around the alphabet for number exceeding 26
  while key > 26
    key -= 26
  end

  #makes the modifier go down the alphabet
  mod = key - 26

  for i in 0...string.length do
    #iterates through each letter of the string
    
    string_letter = string[i].chr
    alphabet.each_with_index do |letter, index|

      if alphabet.include?(string_letter) == false
        #checks if the current character is not in the alphabet array, this includes capital letters

        if letter.upcase == string_letter && alphabet.include?(string_letter.downcase)
          #checks if the current character is capitalized and adds it to the cryptid array if it is
          cryptid[i] = alphabet[index + mod].upcase
          break
        elsif !alphabet.include?(string_letter.downcase)
          #checks if the current character is not a letter and adds it to the cryptid array if it is
          cryptid[i] = string_letter
          break
        end

      elsif letter == string_letter
        #checks if the current character is a letter and adds it to the cryptid array if it is
        cryptid[i] = alphabet[index + mod]
        break
      end
    end
  end
  return cryptid.join
end

print "What would you like to encrypt? "
string = gets.chomp

print "Input the number of shifts for each letter: "
shift = gets.chomp

print "Cipher Text: "
puts caesar_cipher(string, shift)