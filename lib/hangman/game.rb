require "forwardable"

module Hangman
  class Game
    extend Forwardable

    def initialize(engine:, interface:)
      @engine = engine
      @interface = interface
    end

    def play
      success = nil
      until game_over?
        draw_board
        draw_guess(success) if [true, false].include?(success)
        letter = ask_letter
        success = guess(letter)
      end
      draw_board
      game_won? ? handle_game_won : handle_game_lost
    end

    private

    def_delegators :@engine,
      :game_over?,
      :game_won?,
      :guess,
      :letters,
      :incorrect_letters,
      :lives_count

    def_delegators :@interface,
      :ask_letter,
      :handle_game_won,
      :handle_game_lost

    def draw_board
      @interface.clear
      @interface.draw_task
      @interface.draw_gallow(step: incorrect_letters.count)
      @interface.draw_word(letters: letters)
    end

    def draw_guess(success)
      @interface.draw_guess(
        success: success,
        lives_count: lives_count,
        incorrect_letters: incorrect_letters.uniq
      )
    end
  end
end
