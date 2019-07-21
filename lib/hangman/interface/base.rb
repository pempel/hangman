module Hangman
  module Interface
    class Base
      def handle_game_won
        raise "Abstract method called"
      end

      def handle_game_lost
        raise "Abstract method called"
      end

      def ask_letter
        raise "Abstract method called"
      end

      def clear
        raise "Abstract method called"
      end

      def draw_task
        raise "Abstract method called"
      end

      def draw_word(letters:)
        raise "Abstract method called"
      end

      def draw_guess(success:, lives_count:, incorrect_letters:)
        raise "Abstract method called"
      end

      def draw_gallow(step:)
        raise "Abstract method called"
      end
    end
  end
end
