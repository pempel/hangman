module Hangman
  class GameEngine
    LIVES_COUNT = 8

    attr_reader :word, :guessed_letters, :incorrect_letters, :lives_count

    def initialize(word:)
      @word = word.to_s
      @guessed_letters = []
      @incorrect_letters = []
      @lives_count = LIVES_COUNT
    end

    def game_over?
      word_guessed? || !has_lives?
    end

    def game_won?
      word_guessed? && has_lives?
    end

    def letters
      @word.chars.inject([]) do |result, char|
        result << (@guessed_letters.include?(char.downcase) ? char : "")
      end
    end

    def guess(letter)
      letter = letter.to_s.downcase
      if @word.downcase.chars.include?(letter)
        @guessed_letters << letter unless @guessed_letters.include?(letter)
      else
        @incorrect_letters << letter unless @incorrect_letters.include?(letter)
        @lives_count -= 1
      end
    end

    private

    def word_guessed?
      @guessed_letters.uniq.sort == @word.downcase.chars.uniq.sort
    end

    def has_lives?
      @lives_count > 0
    end
  end
end
