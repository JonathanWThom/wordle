# frozen_string_literal: true

RSpec.describe Wordle::GuessValidator do
  let(:instance) { described_class.new(guess, list) }

  shared_context "guess is not 5 letters long" do
    include_context "fake list"
    let(:guess) { "sourdough" }
  end

  shared_context "guess is not in list" do
    include_context "fake list"
    let(:guess) { "wheat" }
  end

  shared_context "guess is valid" do
    include_context "fake list"
    let(:guess) { "bagel" }
  end

  shared_context "fake list" do
    let(:list) do
      FakeList.new
    end
  end

  describe "#invalid?" do
    context "normal mode" do
      subject {
        instance.validate_normal_mode
        instance.invalid?
      }

      context "guess is not 5 letters long" do
        include_context "guess is not 5 letters long"

        it { is_expected.to eq true }
      end

      context "guess is not in list" do
        include_context "guess is not in list"

        it { is_expected.to eq true }
      end

      context "guess is valid" do
        include_context "guess is valid"

        it { is_expected.to eq false }
      end
    end
  end

  describe "#error" do
    subject { instance.error }

    context "normal mode" do
      before { instance.validate_normal_mode }

      context "guess is not 5 letters long" do
        include_context "guess is not 5 letters long"

        it { is_expected.to eq "Guess must be 5 letters long" }
      end

      context "guess is not in list" do
        include_context "guess is not in list"
        it { is_expected.to eq "Guess not in word list" }
      end

      context "guess is valid" do
        include_context "guess is valid"
        it { is_expected.to be_nil }
      end
    end
  end
end

class FakeList
  def invalid?(item)
    !["bread", "bagel"].include?(item)
  end
end
