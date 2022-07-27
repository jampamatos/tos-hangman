# frozen_string_literal: true

require './lib/game_manager'

wordlist = load_words

loop do
  choice = welcome_msg
  case choice
  when 'l'
    game = load_game
    next if ['.', '..'].include? game
  when 'e'
    quit_msg
  else
    game = new_game(wordlist)
  end

  while game.tries.positive?
    break if game.all_correct_letters?

    letter = play_round(game)
    next if game.guessed_letters.include?(letter)

    if game.word.include?(letter)
      good_guess_msg(game, letter)
      next
    else
      incorrect_msg(game, letter)
    end
  end

  end_turn(game)

  again = play_again_msg
  quit_msg unless again == 'y'
end
