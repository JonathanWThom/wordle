# frozen_string_literal: true

RSpec.describe Wordle::Game do
  describe ".play" do
    let(:list) { instance_double(Wordle::List) }
    let(:target_word) { "shear" }
    let(:options) { FakeOptions.new }

    before do
      allow_any_instance_of(Wordle::List).to receive(:random).and_return(target_word)
      allow_any_instance_of(Object).to receive(:gets).and_return(*input)
    end

    shared_examples_for "correct word is guessed" do
      let(:input) { target_word }

      specify { expect { described_class.play(options) }.to output(/🟩🟩🟩🟩🟩/).to_stdout }

      specify {
        expect { described_class.play(options) }.to output(
          /Wordle Gem 7a79a6 1\/6/
        ).to_stdout
      }
    end

    shared_examples_for "correct word is guessed eventually" do
      let(:input) { ["shawl", target_word] }

      specify {
        expect { described_class.play(options) }.to output(
          /🟩🟩🟨⬛️⬛️\n🟩🟩🟩🟩🟩/
        ).to_stdout
      }

      specify {
        expect { described_class.play(options) }.to output(
          /Wordle Gem 7a79a6 2\/6/
        ).to_stdout
      }
    end

    shared_examples_for "correct word is never guessed" do
      let(:input) { Array.new(5, "wrong") }

      specify {
        expect { described_class.play(options) }.to output(
          Regexp.new(Array.new(6, "⬛️🟨⬛️⬛️⬛️").join("\n"))
        ).to_stdout
      }

      specify {
        expect { described_class.play(options) }.to output(
          /Wordle Gem 7a79a6 X\/6*/
        ).to_stdout
      }
    end

    context "correct word is guessed" do
      include_examples "correct word is guessed"
    end

    context "correct word is guessed eventually" do
      include_examples "correct word is guessed eventually"
    end

    context "correct word is never guessed" do
      include_examples "correct word is never guessed"
    end

    context "hard mode" do
      let(:options) { FakeOptions.new(difficult: true) }

      context "correct word is guessed" do
        include_examples "correct word is guessed"
      end

      context "correct word is guessed eventually" do
        include_examples "correct word is guessed eventually"
      end

      context "correct word is never guessed" do
        include_examples "correct word is never guessed"
      end

      context "invalid guess because of must include rule" do
        let(:input) { ["shawl", "sheep", target_word] }

        specify {
          expect { described_class.play(options) }.to output(
            /Guess must include a/
          ).to_stdout
        }
      end

      context "invalid guess because of must match rule" do
        let(:input) { ["sheep", "steep", target_word] }

        specify {
          expect { described_class.play(options) }.to output(
            /2nd letter must be h/
          ).to_stdout
        }
      end
    end
  end
end

class FakeOptions
  def initialize(options = {})
    @options = options
  end

  def read
    @options
  end
end
