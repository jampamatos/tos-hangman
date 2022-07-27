# frozen_string_literal: true

HANGMAN = [
  "







  ",
  "






=========
  ",
  "
  +---+
  |   |
      |
      |
      |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
      |
      |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
 /|\\  |
 /    |
      |
=========
  ",
  "
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
=========
  "
].freeze

def show_hangman(game)
  case game.tries
  when 8
    puts HANGMAN[0]
  when 7
    puts HANGMAN[1]
  when 6
    puts HANGMAN[2]
  when 5
    puts HANGMAN[3]
  when 4
    puts HANGMAN[4]
  when 3
    puts HANGMAN[5]
  when 2
    puts HANGMAN[6]
  when 1
    puts HANGMAN[7]
  when 0
    puts HANGMAN[8]
  end
end

def welcome_msg
  clear_screen
  puts 'Welcome to Ruby Hangman!'
  puts ''
  puts "Please type 'L' to load a game , 'N' to start a new one, or 'E' to exit:"
  start_input
end

def word_size_msg(game)
  puts "I am thinking of a word that is #{game.word_size} letters long..."
end

def available_letters_msg(game)
  puts "Available letters: #{game.available_letters.join}"
  puts ''
end

def letter_guessed_msg
  clear_screen
  puts 'You already guesses that letter!'
end

def round_start_msg(game)
  puts "Chances left: #{game.tries}"
  show_hangman(game)
  available_letters_msg(game)
  game.show_word
  puts "Type 'save' to SAVE AND EXIT game, QUIT to quit or any letter to TRY A GUESS:"
end

def save_msg
  begin
    clear_screen
    puts Dir.entries('../saves')
    puts 'Please enter a save file name:'
    input = gets.chomp
    raise TypeError if /(\.\w+)/.match(input)
    raise NameError if Dir.entries('../saves').include?(input)
  rescue TypeError
    puts 'Please, do not add extention to your save file name.'
    sleep(2)
    retry
  rescue NameError
    puts 'File name exists. Overwrite? (Y/N)'
    over = gets.downcase.chomp
    case over
    when 'y'
      puts "Game saved as '#{input}'"
      return input
    when 'n'
      retry
    else
      puts 'Wrong input.'
      retry
    end
  end
  puts ''
  puts "Game saved as '#{input}'"
  input
end

def load_msg
  begin
    clear_screen
    puts Dir.entries('../saves')
    puts 'Please enter a file name to load or "." to cancel:'
    input = gets.chomp
    raise NameError unless Dir.entries('../saves').include?(input) || input == '.' || input == '..'
  rescue NameError
    puts "File '#{input}' does not exist."
    sleep(2)
    retry
  end
  input
end

def quit_msg
  puts 'Thank you for playing!'
  exit 0
end

def play_again_msg
  puts 'Do you want to play again? (Y/N)'
  again_input
end

def good_guess_msg(game, letter)
  clear_screen
  puts 'Good guess!'
  game.guessed_letters << letter
end

def incorrect_msg(game, letter)
  clear_screen
  puts 'Sorry! Incorrect letter!'
  game.guessed_letters << letter
  game.minus_tries
end

def you_win_msg(game)
  clear_screen
  show_hangman(game)
  puts 'Congratulations! You won!'
end

def you_lost_msg(game)
  clear_screen
  show_hangman(game)
  puts 'Sorry, You lost!'
end
