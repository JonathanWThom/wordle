# frozen_string_literal: true

class Integer
  def ordinalize
    {
      1 => "1st",
      2 => "2nd",
      3 => "3rd",
      4 => "4th",
      5 => "5th",
    }[self]
  end
end
