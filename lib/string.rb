class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def green
    colorize(42)
  end

  def yellow
    colorize(43)
  end

  def gray
    colorize(47)
  end

  def light_blue
    colorize(117)
  end

  def orange
    colorize(202)
  end
end
