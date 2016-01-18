class TimeSetter
  def self.isLeapYear(year)
    ((year % 400) == 0) || ((year % 4 == 0) && (year % 100 != 0))
  end

  def self.daysInYear(year)
    if isLeapYear(year)
      366
    else
      365
    end
  end

  def self.convert(d)
    y = 1980;
    while (d > daysInYear(y))
      d -= daysInYear(y)
      y += 1
    end
    return [y,d]
  end
end
