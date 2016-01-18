Legacy Code
-----------

* What, from your perspective, is "legacy code"?  (We see lots of
  definitions within the chapter.)
* Why do we care about it?
* What kinds of maintainance do we worry about for legacy code?
* How do we do this kind of maintainance?

Refactoring
-----------

* What do you see as the key principles of refactoring?
* What do you see as the key techniques we use to refactor?
* Sam's perspective: There are a few purposes for the list of
  refactoring techniques.
    * They serve to remind programmerss of the kinds of things they
      can do to make code better.
    * They provide us with a *vocabulary* to talk about the kinds of
      changes you might make to a program.
* You should be experienced enough as programmers to have your own list
  of common "code improvements".  What are some of yours?

An Example
----------

<pre class="programlisting">
class TimeSetter
  def self.convert(d)
    y = 1980
    while (d > 365) do
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        if (d > 366)
          d -= 366
          y += 1
        end
      else
        d -= 365
        y += 1
      end
    end
    return y
  end
end
</pre>

Our book refactors this to the following code.

<pre class="programlisting">
class TimeSetter
  ORIGIN_YEAR = 1980
  def self.caclculate_current_year(days_since_origin)
    @@year = ORIGIN_YEAR
    @@days_remaining = days_since_origin
    while (@@days_remaining > 365) do
      if leap_year?
        peel_off_leap_year!
      else
        peel_off_regular_year!
      end
    end
    return @@year
  end
  
  private
  def self.peel_off_leap_year!
    if (@@days_remaining >= 366)
      @@days_remaining -= 366
      @@year += 1
    fi
  end
  def self.peel_off_regular_year!
    @days_remaining -= 365;
    @year += 1;
  end
  def leap_year?
    @year % 400 == 0 ||
      (@year % 4 == 0 && @year % 100 != 0)
  end
end     
</pre>

In contrast, we rewrote (refactored?) it to the following code.

<pre class="programlisting">
lass TimeSetter
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
    return y
  end
end
</pre>

What do you see as athe strengths and weaknesses of each strategy?

Another Example
---------------

From Field et al., pp. 2-4.

<pre class="programlisting">
class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2
  attr_reader :title
  attr_accessor :price_code
  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end 
end

class Rental
  attr_reader :movie, :days_rented
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end 
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      this_amount = 0

      # determine amounts for each line
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      # add frequent renter points
      frequent_renter_points += 1
      # add bonus for a two day new release rental
      if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1
          frequent_renter_points += 1
      end

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
</pre>
