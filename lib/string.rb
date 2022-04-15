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

  def blue
    colorize(46)
  end

  def orange
    "\033[48:2:255:165:0m#{self}\033[m"
  end
end
