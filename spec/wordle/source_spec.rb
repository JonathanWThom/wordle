# frozen_string_literal: true

RSpec.describe Wordle::SOURCE do
  subject { described_class.length }
  it { is_expected.to eq 12972 }
end
