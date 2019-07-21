RSpec.describe Hangman::GameEngine do
  let(:engine) { described_class.new(word: "Hello") }

  before(:each) do
    %w[L p q h r s].each { |l| engine.guess(l) }
  end

  context "#word" do
    it "returns the word" do
      expect(engine.word).to eq("Hello")
    end
  end

  context "#letters" do
    it "returns hidden and revealed letters" do
      expect(engine.letters).to match_array(["H", "", "l", "l", ""])
    end
  end

  context "#guessed_letters" do
    it "returns only guessed letters" do
      expect(engine.guessed_letters).to match_array(["l", "h"])
    end
  end

  context "#incorrect_letters" do
    it "returns only incorrect letters" do
      expect(engine.incorrect_letters).to match_array(["p", "q", "r", "s"])
    end
  end

  context "#lives_count" do
    it "returns the current number of lives" do
      expect(engine.lives_count).to eq(8 - 4)
    end
  end

  context "#game_over?" do
    it "returns true if the game is over" do
      engine.guess("e")
      engine.guess("o")

      expect(engine.game_over?).to be(true)
    end
  end

  context "#game_won?" do
    it "returns true if the game is won" do
      engine.guess("e")
      engine.guess("o")

      expect(engine.game_won?).to be(true)
    end
  end
end
