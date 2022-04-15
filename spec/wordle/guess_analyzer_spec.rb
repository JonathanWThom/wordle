# frozen_string_literal: true

RSpec.describe Wordle::GuessAnalyzer do
  describe "#colors" do
    context "same letter twice with only one match and no other instances" do
      let(:analyzer) { described_class.new("tangy", "mamma") }

      it "marks the match as green and non-match as gray" do
        m = "m".gray
        a_green = "a".green
        a_gray = "a".gray
        expected = "#{m}#{a_green}#{m}#{m}#{a_gray}"

        expect(analyzer.colors).to eq expected
      end
    end

    context "correct guess" do
      subject { described_class.new("tangy", "tangy").colors }

      it { is_expected.to eq ["t", "a", "n", "g", "y"].map(&:green).join("") }
    end
  end

  describe "#match?" do
    subject { described_class.new(target_word, guess).match? }
    let(:target_word) { "irate" }

    context "guess is correct" do
      let(:guess) { target_word }

      it { is_expected.to be_truthy }
    end

    context "guess is incorrect" do
      let(:guess) { "scoot" }

      it { is_expected.to be_falsey }
    end
  end
end
