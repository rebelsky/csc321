CSC321.01 2016F, Class 17: Codes of Ethics, Revisited
=====================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Writing prompt.
* Refactoring exercises.
* Codes of ethics, revisited.

Preliminaries
-------------

### Admin

### Upcoming Work

* For Wednesday: Find more things wrong with the movie rental program and think
  about how to fix them.
* Reading for Friday:
    * Wikipedia on UML.  <https://en.wikipedia.org/wiki/Unified_Modeling_Language>
    * SaaS: 11.2 (Just enough UML)
* Reading Journal for Friday (due Thursday at 11pm)
    * Subject: Reading Journal for Class 18 (Your Name)
        * What do you see as particular values of using UML?
        * What challenges do you see in using UML?  (That is, why
          might teams choose not to use UML.)

### Good Things to Do

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Grinnell Prize Events this week.  (Too many to list.)

### Questions

Writing Prompt
--------------

Write a short essay reflecting on some ethic of software engineering (e.g.,
ethics of software engineering as a service).

Due: Friday the 14th of October.
   * Free three-week extension. 

Parameters

* Address your question from the perspective of a software engineer or entrepreneur (not a user).
* Write approximately 400-800 words. Your essay should be tight: Don't waste words!
* Cite at least two of the assigned readings (from the two sets of readings) and at least three additional sources.
    * Your additional sources could be our textbook or a reading from another, relevant class.
    * Your additional sources could be a research article, magazine article, news article, or even a substantial blog post. The ACM magazines are all good sources, depending on your topic of interest.
* Use APA or ACM style for your citations.
* Use a 10-12 point font and double spacing (about 2-3 pages). Do not use a separate cover page.
* You will have the opportunity to revise your essay once.
* I will retain a copy of the final version of your essay for the departmental 
  discussions on writing in the CS curriculum and ethics in the CS curriculum.

Questions

* Should we talk to you about our topics?  Yes.
* Can it be as specific as Facebook's newsfeed targeting experiment?  Sure.

A Refactoring Example
---------------------

We'll continue our example from last class.  What "smells wrong"
in this example?  (And no, don't say "The hog farm smell from this
morning.")

<pre>
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
    return [y,d]
  end
end
</pre>

What things don't feel right and might be a clue that we have to change
something?

* Magic numbers!  Use constants.  (Variables that can't vary.)
* If statements.
    * Strangely nested.
    * One has no alternative.
    * Complex calculation with no explanation.
        * Is that complex statement any different than (year % 4) == 0?
        * Yes!  1900 (aka 80 b.g.) is not a leap year, nor is 2100.
* No documentation.  
* Bad variable names.
* Repeated identical code: `year += 1`

<pre>
class TimeSetter
  BEGINNING_OF_TIME = 1980     // When Bill Gates quit Harvard
  DAYS_IN_NORMAL_YEAR = 365    // Not a leap year
  DAYS_IN_LEAP_YEAR = 366      // Abnormal year

  def self.convert(day)
    year = BEGINNING_OF_TIME
    while (day > DAYS_IN_NORMAL_YEAR) do
      if (isLeapYear(year)) 
        if (day > DAYS_IN_LEAP_YEAR)
          day -= DAYS_IN_LEAP_YEAR
          # year += 1
        else
        end
      else
        day -= DAYS_IN_NORMAL_YEAR
        # year += 1
      end
      year += 1
    end # while
    return [year,day]
  end

  def self.isLeapYear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
  end
end
</pre>

<pre>
<pre>
class TimeSetter
  // Convert the date from "days since start of time" to "current year
  // ..."
  // Pre: day is a positive integer
  def self.convert(day)
    year = START_OF_TIME
    while (day > numOfDaysInYear(year))
      day -= numOfDaysInYear(year)
      year += 1
    end
    return [year,day]
  end

  // Pre: year is an integer
  def self.isLeapYear(year)
    // According to Wikipedia, not every year divisible by 4 is a 
    // leap year.  In particular, years divisible by 100 are *not*
    // leap years, with the exception of years divisible by 400,
    // which are.
    //   https://en.wikipedia.org/wiki/Leap_year#Algorithm
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
  end

  // Pre: year is an integer
  def self.numOfDaysInYear(year)
    if (isLeapYear(year))
      return DAYS_IN_LEAP_YEAR;
    else
      return DAYS_IN_NORMAL_YEAR;
    end
  end
end
</pre>

Another Refactoring Example
---------------------------

From Fields et al., _Refactoring: Ruby Edition, pp. 2-4.

<pre>
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
      # add bonus for a two-or-more day new release rental
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

What in this code might make you worry?

Issue 1: The code for computing the cost should be moved to a separate method.

<pre>
  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      this_amount = 0

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

  def costFor(element)
    result = 0
    # determine amounts for each line
    case element.movie.price_code
    when Movie::REGULAR
      result += 2
      result += (element.days_rented - 2) * 1.5 if element.days_rented > 2
    when Movie::NEW_RELEASE
      result += element.days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (element.days_rented - 3) * 1.5 if element.days_rented > 3
    end
    return result
  end
</pre>

Issue 2: Why use numbers when numbers don't make sense?  Use objects or symbols.

* Why use numbers or symbols rather than objects?  Faster to compare!
* Why use objects rather than numbers or symbols?  We can give it other fields
    * Default rental length
    * Regular per-day price
    * Overdue per-day price

<pre>
class MovieCategory
end
REGULAR = new MovieCategory(...)
NEW_RELEASE = new MovieCategory(...)
CHILDRENS = new MovieCategory(...)
</pre>

<pre>
REGULAR = :REGULAR
NEW_RELEASE = :NEW_RELEASE
CHILDRENS = :CHILDRENS
</pre>

Codes of Ethics, Applied
------------------------

Where should ethics of computing professionals fit within the Grinnell CS
curriculum?

