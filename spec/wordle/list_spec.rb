# frozen_string_literal: true

RSpec.describe Wordle::List do
  describe "#random" do
    subject { described_class.new.random.length }

    it { is_expected.to eq 5 }
  end

  describe "#invalid?" do
    subject { described_class.new.invalid?(word) }

    context "word is in list" do
      let(:word) { "green" }

      it { is_expected.to eq false }
    end

    context "word is not in list" do
      let(:word) { "asdfg" }

      it { is_expected.to eq true }
    end
  end
end
