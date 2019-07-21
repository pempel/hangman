RSpec.describe Hangman::UserInterface::Default do
  let(:ui) { described_class.new(word_definition: "Definition") }

  before(:each) do
    allow($stdout).to receive(:write)
  end

  context "#handle_game_won" do
    it "prints congratulations" do
      text = "Congratulations! You have guessed the word!\n"
      expect { ui.handle_game_won }.to output(text).to_stdout
    end
  end

  context "#handle_game_lost" do
    it "prints apologies" do
      text = "Sorry, game over. You need to try one more time...\n"
      expect { ui.handle_game_lost }.to output(text).to_stdout
    end
  end

  context "#ask_letter" do
    it "asks the user to input a letter" do
      allow(ui).to receive(:gets).and_return("letter\n")

      expect { ui.ask_letter }.to output("Guess a letter: ").to_stdout
      expect(ui.ask_letter).to eq("l")
    end
  end

  context "#draw_task" do
    it "prints the task" do
      text = "You need to guess the word:\nDefinition\n"
      expect { ui.draw_task }.to output(text).to_stdout
    end
  end

  context "#draw_word" do
    it "prints the word with dashes" do
      letters = ["", "l", "", "x"]
      text = "\n_ l _ x\n\n"
      expect { ui.draw_word(letters: letters) }.to output(text).to_stdout
    end
  end

  context "#draw_guess" do
    it "prints the current guess if the guess was incorrect" do
      text = "Bad luck!\nYou have 1 life left.\nIncorrect letters: t, q.\n\n"
      expect {
        ui.draw_guess(
          failed: true,
          lives_count: 1,
          incorrect_letters: ["t", "q"]
        )
      }.to output(text).to_stdout
    end

    it "prints the current guess if the guess was correct" do
      text = "Good guess!\nYou have 2 lives left.\nIncorrect letters: t, q.\n\n"
      expect {
        ui.draw_guess(
          failed: false,
          lives_count: 2,
          incorrect_letters: ["t", "q"]
        )
      }.to output(text).to_stdout
    end
  end

  context "#draw_gallow" do
    it "prints the gallow for the specified step" do
      text = begin
        "\n"\
        "     ------   \n"\
        "    |/     |  \n"\
        "    |      0  \n"\
        "    |         \n"\
        "    |         \n"\
        "    |         \n"\
        "    |         \n"\
        "    |         \n"\
        "_ _ | _ _     \n"\
        "\n"
      end
      expect { ui.draw_gallow(step: 2) }.to output(text).to_stdout
    end
  end
end
