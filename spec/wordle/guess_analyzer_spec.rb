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
end
