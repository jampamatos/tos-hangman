# RUBY HANGMAN

## About

This repo contains the Hangman Project for [The Odin Project's](https://www.theodinproject.com) Basic Ruby Path. It's a working command line game of Hangman, in which players try to guess a secret word, chosen by the computer, by suggesting letters within a certain number of guesses. Each miss a diagram of a "hanged man" is updated, until the player either guesses the correct word or run out of tries.

More info on Hangman on [Wikipedia](https://en.wikipedia.org/wiki/Hangman_(game)).

## Assignment

You will be building a simple command line Hangman game where one player plays against the computer, but a bit more advanced.

1. Download the google-10000-english-no-swears.txt dictionary file from the first20hours GitHub repository [google-10000-english](https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt).
2. When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
3. You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. `_ r o g r a _ _ i n g`) and which incorrect letters have already been chosen.
4. Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.
5. Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects… you can serialize your game class too!
6. When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!

## Checklist

- [X] Create a `Game` class
- [x] Logic for loading word dictionary and choosing a random word
- [X] Logic for updating available letters
- [X] Logic for showing discovered words
- [X] Logic for checking game end
- [X] Basic game round logic
- [X] Saving and Loading game
- [X] Adding stick figure

## TO-DO

- [ ] Logic for guessing the entire word
- [ ] Polishing with [`colorize`](https://github.com/fazibear/colorize)
- [ ] Clean up code
