# frozen_string_literal: true

require './lib/game'
require './lib/messages'
# require './game'
# require './messages'

WORDLIST_FILE = 'google-10000-english-no-swears.txt'
Dir.chdir(File.dirname(__FILE__)) # File in the same directory

def load_words
  wordlist = []
  puts 'Loading word list from file...'

  File.readlines(WORDLIST_FILE).each do |line|
    line.split.each { |word| wordlist.push(word) if word.size.between?(5, 12) }
  end

  puts "#{wordlist.length} words loaded."
  sleep(2)
  wordlist
end

def clear_screen
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def get_word(wordlist)
  wordlist.sample
end

def start_input
  begin
    input = gets.downcase.chomp
    raise TypeError unless %w[l n e].include?(input)
  rescue TypeError
    puts "Please, type 'L' to load a game, 'N' to start a new one, 'E' to exit:"
    retry
  end
  puts ''
  input
end

def round_input
  begin
    input = gets.downcase.chomp
    raise TypeError unless input == 'save' || input == 'quit' || input.size == 1 && /\D/.match(input)
  rescue TypeError
    puts "Please, type 'save' to save game or any letter to try a guess"
    retry
  end
  puts ''
  input
end

def again_input
  begin
    input = gets.downcase.chomp
    raise TypeError unless %w[y n].include?(input)
  rescue TypeError
    puts "Please, type 'Y' to play again or 'N' to quit:"
    retry
  end
  puts ''
  input
end

def play_round(game)
  round_start_msg(game)
  input = round_input
  case input
  when 'save'
    save_game(game)
    exit 0
  when 'quit'
    quit_msg
  else
    game.guess_letter(input)
  end
  input
end

def new_game(wordlist)
  clear_screen
  game = Game.new(get_word(wordlist))
  word_size_msg(game)
  game
end

def end_turn(game)
  if game.all_correct_letters?
    you_win_msg(game)
  else
    you_lost_msg(game)
  end
  puts "The word I was thinking of is #{game.word.upcase}"
  puts ''
end

def save_game(game)
  save_game = game.to_yaml
  savename = save_msg
  File.open("../saves/#{savename}", 'w') { |file| file.puts save_game }
end

def load_game
  load_file = load_msg
  return load_file if ['.', '..'].include? load_file

  serialized = File.read("../saves/#{load_file}")
  Game.from_yaml(serialized)
end
