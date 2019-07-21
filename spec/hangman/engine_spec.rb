RSpec.describe Hangman::Engine do
  let(:engine) { described_class.new(word: "Hello") }

  before(:each) do
    %w[L l p q h r r s].each { |l| engine.guess(l) }
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
      expect(engine.guessed_letters).to match_array(%w[l l h])
    end
  end

  context "#incorrect_letters" do
    it "returns only incorrect letters" do
      expect(engine.incorrect_letters).to match_array(%w[p q r r s])
    end
  end

  context "#lives_count" do
    it "returns the current number of lives" do
      expect(engine.lives_count).to eq(8 - 5)
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

  context "#guess" do
    it "returns true if the guess is correct" do
      result = engine.guess("e")

      expect(result).to be(true)
    end

    it "returns false if the guess is incorrect" do
      result = engine.guess("q")

      expect(result).to be(false)
    end
  end
end
