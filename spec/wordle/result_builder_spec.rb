# frozen_string_literal: true

RSpec.describe Wordle::ResultBuilder do
  describe "#text_color" do
    subject { instance.text_color(result) }

    let(:instance) { described_class.new(high_contrast) }

    context "default" do
      let(:high_contrast) { false }

      context "match" do
        let(:result) { instance.match }

        it { is_expected.to eq :green }
      end

      context "included" do
        let(:result) { instance.included }

        it { is_expected.to eq :yellow }
      end

      context "miss" do
        let(:result) { instance.miss }

        it { is_expected.to eq :gray }
      end
    end

    context "high contrast" do
      let(:high_contrast) { true }

      context "match" do
        let(:result) { instance.match }

        it { is_expected.to eq :orange }
      end

      context "included" do
        let(:result) { instance.included }

        it { is_expected.to eq :blue }
      end

      context "miss" do
        let(:result) { instance.miss }

        it { is_expected.to eq :gray }
      end
    end
  end

  describe "#square" do
    subject { instance.square(result) }
    let(:instance) { described_class.new(high_contrast) }

    context "default" do
      let(:high_contrast) { false }

      context "match" do
        let(:result) { instance.match }

        it { is_expected.to eq "🟩" }
      end

      context "included" do
        let(:result) { instance.included }

        it { is_expected.to eq "🟨" }
      end

      context "miss" do
        let(:result) { instance.miss }

        it { is_expected.to eq "⬛️" }
      end
    end

    context "high contrast" do
      let(:high_contrast) { true }

      context "match" do
        let(:result) { instance.match }

        it { is_expected.to eq "🟧" }
      end

      context "included" do
        let(:result) { instance.included }

        it { is_expected.to eq "🟦" }
      end

      context "miss" do
        let(:result) { instance.miss }

        it { is_expected.to eq "⬛️" }
      end
    end
  end
end
