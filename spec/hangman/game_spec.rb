RSpec.describe Hangman::Game do
  class self::TestInterface < Hangman::Interface::Base
    def handle_game_won
      puts "Game won!"
    end

    def handle_game_lost
      puts "Game lost!"
    end

    def ask_letter
      print "Guess a letter: "
      gets.chomp[0]
    end

    def clear
    end

    def draw_task
      puts "Task"
    end

    def draw_word(letters:)
      puts letters.map { |l| l == "" ? "_" : l }.join(" ")
    end

    def draw_guess(success:, lives_count:, incorrect_letters:)
      puts success ? "Good guess!" : "Bad luck!"
    end

    def draw_gallow(step:)
      puts "Gallow: " + Array.new(step, "*").join("")
    end
  end

  let(:engine) { Hangman::Engine.new(word: "Test") }
  let(:interface) { self.class::TestInterface.new }
  let(:game) { described_class.new(engine: engine, interface: interface) }

  before(:each) do
    allow($stdout).to receive(:write)
  end

  context "#play" do
    it "plays the game" do
      allow(interface).to receive(:gets).and_return("e", "z", "x", "s", "t")
      output = begin
        "Task\n"           \
        "Gallow: \n"       \
        "_ _ _ _\n"        \
        "Guess a letter: " \
        ""                 \
        "Task\n"           \
        "Gallow: \n"       \
        "_ e _ _\n"        \
        "Good guess!\n"    \
        "Guess a letter: " \
        ""                 \
        "Task\n"           \
        "Gallow: *\n"      \
        "_ e _ _\n"        \
        "Bad luck!\n"      \
        "Guess a letter: " \
        ""                 \
        "Task\n"           \
        "Gallow: **\n"     \
        "_ e _ _\n"        \
        "Bad luck!\n"      \
        "Guess a letter: " \
        ""                 \
        "Task\n"           \
        "Gallow: **\n"     \
        "_ e s _\n"        \
        "Good guess!\n"    \
        "Guess a letter: " \
        ""                 \
        "Task\n"           \
        "Gallow: **\n"     \
        "T e s t\n"        \
        "Game won!\n"
      end

      expect { game.play }.to output(output).to_stdout
    end
  end
end
