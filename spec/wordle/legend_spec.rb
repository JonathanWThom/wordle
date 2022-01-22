# frozen_string_literal: true

RSpec.describe Wordle::Legend do
  describe ".print" do
    specify { expect { described_class.print }.to output.to_stdout }
  end
end
