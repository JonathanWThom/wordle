# frozen_string_literal: true

RSpec.describe Wordle::Game do
  describe "#play" do
    let(:list) { instance_double(Wordle::List) }
    let(:target_word) { "shear" }

    before do
      allow_any_instance_of(Wordle::List).to receive(:random).and_return(target_word)
      allow_any_instance_of(Object).to receive(:gets).and_return(input)
    end

    context "correct word is guessed" do
      let(:input) { target_word }

      specify { expect { described_class.new.play }.to output(/🟩🟩🟩🟩🟩/).to_stdout }
    end
  end
end
