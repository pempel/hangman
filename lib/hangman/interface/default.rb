require_relative "base"

module Hangman
  module Interface
    class Default < Base
      def initialize(word_definition:)
        @word_definition = word_definition
      end

      def handle_game_won
        puts "Congratulations! You have guessed the word!"
      end

      def handle_game_lost
        puts "Sorry, game over. You need to try one more time..."
      end

      def ask_letter
        print "Guess a letter: "
        gets.chomp[0]
      end

      def clear
        system "clear"
      end

      def draw_task
        puts "You need to guess the word by its definition:"
        puts @word_definition
      end

      def draw_word(letters:)
        puts letters.map { |l| l == "" ? "_" : l }.join(" ")
        puts
      end

      def draw_guess(success:, lives_count:, incorrect_letters:)
        puts success ? "Good guess!" : "Bad luck!"

        text = "#{lives_count} #{lives_count == 1 ? 'life' : 'lives'}"
        puts "You have #{text} left."

        if incorrect_letters.count > 0
          puts "Incorrect letters: #{incorrect_letters.join(', ')}."
        end

        puts
      end

      def draw_gallow(step: 0)
        case step
        when 0
          puts
          puts "     ------    "
          puts "    |/         "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 1
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 2
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 3
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |      |   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 4
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |      |   "
          puts "    |      |   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 5
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |     /|   "
          puts "    |      |   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 6
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |     /|\\ "
          puts "    |      |   "
          puts "    |          "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        when 7
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |     /|\\ "
          puts "    |      |   "
          puts "    |     /    "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        else
          puts
          puts "     ------    "
          puts "    |/     |   "
          puts "    |      0   "
          puts "    |     /|\\ "
          puts "    |      |   "
          puts "    |     / \\ "
          puts "    |          "
          puts "    |          "
          puts "_ _ | _ _      "
          puts
        end
      end
    end
  end
end
