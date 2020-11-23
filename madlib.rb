def a_or_an(str)
  if str[0] =~ /[aeiou]/i
    str =  "an #{str}"
  else
    str = "a #{str}"
  end
end

def book_mad_lib
  puts "Enter an adjective: "
    adjective = gets.chomp
  puts "Enter a noun: "
    noun = a_or_an(gets.chomp) 
  puts "Enter a plural noun: "
    plural_noun = gets.chomp
  puts "Name a female in the room: "
    female = gets.chomp
  puts "Enter another adjective: "
    adjective_2 = gets.chomp
  puts "Enter an article of clothing: "
    clothing = gets.chomp
  puts "Enter another noun: "
    noun_2 = gets.chomp
  puts "Enter a city: "
    city = gets.chomp
  puts "Enter another plural noun: "
    plural_noun_2 = gets.chomp
  puts "Enter another adjective: "
    adjective_3 = gets.chomp
  puts "Enter a body part: "
    body_part = gets.chomp
  puts "Enter a letter of the alphabet: "
    letter = gets.chomp
  puts "Name a celebrity: "
    celebrity = gets.chomp
  puts "Enter another plural noun: "
    plural_noun_3 = gets.chomp
  puts "Enter another adjective: "
    adjective_4 = gets.chomp
  puts "Enter a place you like to go: "
    place = gets.chomp
  puts "Enter another body part: "
    body_part_2 = gets.chomp
  puts "Enter another adjective: "
    adjective_5 = gets.chomp
  puts "Enter (oh my god) ANOTHER adjective: "
    adjective_6 = gets.chomp
  puts "Enter a verb: "
    verb = gets.chomp
  puts "Enter another plural noun: "
    plural_noun_4 = gets.chomp
  puts "Enter a number: "
    number = gets.chomp
  
  File.open('MadLibs/Book.txt', 'r') do |file|
    madlib = file.read #I am so sorry for what is about to happen...
    
    madlib.gsub!("{{adjective}}", "#{adjective}")
    madlib.gsub!("{{noun}}", "#{noun}")
    madlib.gsub!("{{plural noun}}", "#{plural_noun}")
    madlib.gsub!("{{female in room}}", "#{female}")
    madlib.gsub!("{{adjective_2}}", "#{adjective_2}")
    madlib.gsub!("{{article of clothing}}", "#{clothing}")
    madlib.gsub!("{{noun_2}}", "#{noun_2}")
    madlib.gsub!("{{city}}", "#{city}")
    madlib.gsub!("{{plural noun_2}}", "#{plural_noun_2}")
    madlib.gsub!("{{adjective_3}}", "#{adjective_3}")
    madlib.gsub!("{{body part}}", "#{body_part}")
    madlib.gsub!("{{letter of alphabet}}", "#{letter}")
    madlib.gsub!("{{celebrity}}", "#{celebrity}")
    madlib.gsub!("{{plural noun_3}}", "#{plural_noun_3}")
    madlib.gsub!("{{adjective_4}}", "#{adjective_4}")
    madlib.gsub!("{{a place}}", "#{place}")
    madlib.gsub!("{{body part_2}}", "#{body_part_2}")
    madlib.gsub!("{{adjective_5}}", "#{adjective_5}")
    madlib.gsub!("{{adjective_6}}", "#{adjective_6}")
    madlib.gsub!("{{verb}}", "#{verb}")
    madlib.gsub!("{{plural noun_4}}", "#{plural_noun_4}")
    madlib.gsub!("{{number}}", "#{number}")
    
    puts madlib
    file.close
    
    would_you_like_to_play_again
  end
end
    
def thanksgiving_mad_lib
  puts "Enter a noun: "
  noun = gets.chomp
  puts "Name a person in the room: "
  person = gets.chomp
  puts "Enter a verb: "
  verb = gets.chomp
  puts "Enter a part of the body (plural): "
  body_part1 = gets.chomp
  puts "Enter an adjective: "
  adjective1 = gets.chomp
  puts "Enter another noun: "
  noun2 = gets.chomp
  puts "Enter another noun: "
  noun3 = gets.chomp
  puts "Enter a plural noun: "
  plural_noun = gets.chomp
  puts "Enter a type of liquid: "
  liquid = gets.chomp
  puts "Enter another adjective: "
  adjective2 = gets.chomp
  puts "Enter another noun: "
  noun4 = gets.chomp
  puts "Enter another noun: "
  noun5 = gets.chomp
  puts "Enter another noun: "
  noun6 = gets.chomp
  puts "Enter another plural noun: "
  plural_noun2 = gets.chomp
  puts "Name a female in the room: "
  female = gets.chomp
  puts "Enter another noun: "
  noun7 = gets.chomp
  puts "Enter another body part (plural): "
  body_part2 = gets.chomp
  
  File.open('MadLibs/Thanksgiving.txt', 'r') do |file|
    madlib = file.read
    
    madlib.gsub!("{{noun}}", "#{noun}")
    madlib.gsub!("{{person in room}}", "#{person}")
    madlib.gsub!("{{verb}}", "#{verb}")
    madlib.gsub!("{{body part plural}}", "#{body_part1}")
    madlib.gsub!("{{adjective}}", "#{adjective1}")
    madlib.gsub!("{{noun2}}", "#{noun2}")
    madlib.gsub!("{{noun3}}", "#{noun3}")
    madlib.gsub!("{{plural noun}}", "#{plural_noun}")
    madlib.gsub!("{{type of liquid}}", "#{liquid}")
    madlib.gsub!("{{adjective2}}", "#{adjective2}")
    madlib.gsub!("{{noun4}}", "#{noun4}")
    madlib.gsub!("{{noun5}}", "#{noun5}")
    madlib.gsub!("{{noun6}}", "#{noun6}")
    madlib.gsub!("{{plural noun2}}", "#{plural_noun2}")
    madlib.gsub!("{{female in room}}", "#{female}")
    madlib.gsub!("{{noun7}}", "#{noun7}")
    madlib.gsub!("{{body part plural 2}}", "#{body_part2}")
    #repeating the smae thing over and over multiple times
    
    puts madlib
    file.close
    
    would_you_like_to_play_again
  end
end
  
def  vacation_mad_lib
  puts "Enter an adjective: "
    adjective = gets.chomp
  puts "Enter another adjective: "
    adjective_2 = gets.chomp
  puts "Enter a noun: "
    noun = a_or_an(gets.chomp)
  puts "Enter ANOTHER noun: "
    noun_2 = a_or_an(gets.chomp)
  puts "Enter a plural noun: "
    plural_noun = gets.chomp
  puts "What is a game you like to play?"
    game = gets.chomp
  puts "Enter a verb ending in \"ing\": "
    verb = gets.chomp
      until verb =~ /[(ing), (ING)]\Z/ do
        puts "Hey, man. I said a verb ending in \"ing\". "
        puts "Enter a verb ending in \"ing\": "
        verb = gets.chomp
      end
  puts "Now do it again, because why not. Another verb ending in \"ing\": "
    verb_2 = gets.chomp
      until verb_2 =~ /[(ing), (ING)]\Z/ do
        puts "Hey, man. I said a verb ending in \"ing\". "
        puts "Enter a verb ending in \"ing\": "
        verb_2= gets.chomp
      end
  puts "Enter another plural noun: "
    plural_noun_2 = gets.chomp
  puts "Guess what, sucker? Another verb, ending in \"ing\": "
    verb_3 = gets.chomp
      until verb =~ /[(ing), (ING)]\Z/ do
        puts "Hey, man. I said a verb ending in \"ing\". "
        puts "Enter a verb ending in \"ing\": "
        verb = gets.chomp
      end
  puts "Time to switch it up. How about you enter another noun: "
    noun_3 = a_or_an(gets.chomp)
  puts "Do you like plants? Cause this is how you type in a plant: " ; print ">"
    plant = gets.chomp
  puts "Enter a part of the body: "
    body_part = gets.chomp
  puts "Name a place you've heard of before: "
    place = gets.chomp
  puts "Last one, I promise. Enter another verb ending in \"ing\": "
    verb_4 = gets.chomp
      until verb =~ /[(ing), (ING)]\Z/ do
        puts "Hey, man. I said a verb ending in \"ing\". "
        puts "Enter a verb ending in \"ing\": "
        verb = gets.chomp
      end
  puts "Would you kindly enter another adjective: "
    adjective_3 = gets.chomp
  puts "Enter your favorite number: "
    number = gets.chomp
  puts "And....finally...enter another plural noun: "
    plural_noun_3 = gets.chomp
  
  File.open('MadLibs/Vacation.txt', 'r') do |file|
  madlib = file.read
  
  madlib.gsub!("{{adjective}}" , "#{adjective}")
  madlib.gsub!("{{adjective2}}", "#{adjective_2}")
  madlib.gsub!("{{noun}}", "#{noun}")
  madlib.gsub!("{{noun2}}", "#{noun_2}")
  madlib.gsub!("{{plural noun}}", "#{plural_noun}")
  madlib.gsub!("{{game}}", "#{game}")
  madlib.gsub!("{{plural noun2}}", "#{plural_noun_2}")
  madlib.gsub!("{{verb ending in \"ing\"}}", "#{verb}")
  madlib.gsub!("{{verb ending in \"ing\"2}}", "#{verb_2}")
  madlib.gsub!("{{plural noun3}}", "#{plural_noun_3}")
  madlib.gsub!("{{verb ending in \"ing\"3}}", "#{verb_3}")
  madlib.gsub!("{{noun3}}", "#{noun_3}")
  madlib.gsub!("{{plant}}", "#{plant}")
  madlib.gsub!("{{part of body}}", "#{body_part}")
  madlib.gsub!("{{a place}}", "#{place}")
  madlib.gsub!("{{verb ending in \"ing\"4}}", "#{verb_4}")
  madlib.gsub!("{{adjective3}}", "#{adjective_3}")
  madlib.gsub!("{{number}}", "#{number}")
  madlib.gsub!("{{plural noun3}}", "#{plural_noun_3}")
  
  puts madlib
  file.close
  
  would_you_like_to_play_again
  end
end

def choose_game
  list_of_games = Dir.entries("MadLibs").select { |f| File.file?("MadLibs/#{f}") }
  puts "Welcome to MadLibs! Which story would you like to write?" #work on this
  print list_of_games 
  print " Choose A, B or C: "
  game_choice = gets.chomp

  until game_choice =~ /\A[AaBbCc]\Z/ do
    puts "Invalid response! Please choose A, B or C: "
    game_choice = gets.chomp
  end #loop back to beginning

  if game_choice == "A" || game_choice == "a"
    book_mad_lib
  elsif game_choice == "B" || game_choice == "b"
    thanksgiving_mad_lib
  elsif game_choice == "C" || game_choice == "c"
    vacation_mad_lib
  else
  puts "We should never get here"
  end
end

def would_you_like_to_play_again
  puts "Would you like to try another game? Type y/n: >"
play_again = gets.chomp
  until play_again =~ /[n]/i
    choose_game
  end
end




choose_game






