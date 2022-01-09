# frozen_string_literal: true

RSpec.describe Wordle do
  it "has a version number" do
    expect(Wordle::VERSION).not_to be nil
  end
end
