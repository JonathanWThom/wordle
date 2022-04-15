# frozen_string_literal: true

RSpec.describe Wordle::GuessValidator do
  let(:instance) do
    described_class.new(
      guess,
      list,
      hard_mode,
      must_include,
      must_match,
    )
  end
  let(:hard_mode) { false }
  let(:must_include) { [] }
  let(:must_match) { [] }

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

  shared_context "hard mode" do
    let(:hard_mode) { true }
  end

  shared_context "guess does not include previously guessed letter" do
    include_context "guess is valid"
    let(:must_include) { ["x"] }
  end

  shared_context "guess does not include previously matched letter" do
    include_context "guess is valid"
    let(:must_match) { ["y"] }
  end

  shared_context "guess includes all previously guessed and matched letters" do
    include_context "guess is valid"
    let(:must_match) { ["b"] }
    let(:must_include) { ["a"] }
  end

  shared_context "fake list" do
    let(:list) do
      FakeList.new
    end
  end

  describe "#invalid?" do
    subject { instance.invalid? }

    context "normal mode" do
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

    context "hard mode" do
      include_context "hard mode"

      context "guess does not include previously guessed letter" do
        include_context "guess does not include previously guessed letter"
        it { is_expected.to eq true }
      end

      context "guess does not include previously matched letter" do
        include_context "guess does not include previously matched letter"
        it { is_expected.to eq true }
      end

      context "guess includes all previously guessed and matched letters" do
        include_context "guess includes all previously guessed and matched letters"
        it { is_expected.to eq false }
      end
    end
  end

  describe "#error" do
    subject { instance.error }

    context "normal mode" do
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

    context "hard mode" do
      include_context "hard mode"

      context "guess does not include previously guessed letter" do
        include_context "guess does not include previously guessed letter"
        it { is_expected.to eq "Guess must include x" }
      end

      context "guess does not include previously matched letter" do
        include_context "guess does not include previously matched letter"
        it { is_expected.to eq "1st letter must be y" }
      end

      context "guess includes all previously guessed and matched letters" do
        include_context "guess includes all previously guessed and matched letters"
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
