CSC 321 2015F, Class 12: Legacy Code, Refactoring, and Beyond
-------------------------------------------------------------

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Legacy code.
* Smells and refactoring.
* Some examples.

Preliminaries
-------------

### Admin

* Pre-break PSA.
* 7pm, Tuesday after break: Alum on contracts (NDAs, Non-competes, etc.)
* Important news relevant to 321/322 (will be announced to the department soon).
    * Additional important news will be announced after break.
* Homework for Tuesday after break
    * Finish part 1 of the Legacy Code assignment.
    * Read Chapter 11 (and journal).

### Questions

Legacy Code
-----------

Preliminary Questions

* What is legacy code?  (Consider the three or four definitions in the
  chapter as well as your own views.)
* Why do we care about it?
* What kinds of maintainance do we worry about for legacy code?
* How do we do this kind of maintainance?

What is legacy code? - Some definitions

* Previously written code that is not under active development and
  is not familiar to those who are interacting with it at the codebase
  level.
* (See above) that is currently being used.
* Our book suggests that legacy code is code that is being used that
  doesn't have tests.

What is legacy code? - Some questions

* Is something legacy code if no one is using it?  Not under most definitions.
* Is something legacy code just because it's old?  No.  If the code is
  new to the current developers and it isn't (...), then it can be legacy code.
  Similarly, old code that is (...) need not be legacy code.
* Is something legacy code just because you don't know what it is?
* Is something not legacy code because it's not under active development?
* Is XP legacy code?

Additional questions - 

* What is the relationship between legacy code and beautiful code
  and smelly code?

Why do we care about legacy code?

* It's likely that we will have to deal with it at some point.
* You can't always start from scratch.

In what ways do we "maintain" legacy code?

* The libraries and systems that our code depends on may evolve; we have
  to update the code to work with these evolved libraries and systems.
* Bugs can continue to appear in legacy code.  We need to maintain.
* Perfective maintainance - Add a new feature.
* Preventative maintainance - Update the code in advance of other problems.

How do we do this kind of maintainance?

* We study the code.
* We document the code (as we study, as we test, as we ...).
    * Documentation can be dangerous.
* We write tests.  Lots and lots of tests.  And Cucumber scenarios.
    * Tests make it safe to change the code.
* We also do regression tests.
* We refactor the code.

Refactoring
-----------

* What do you see as the key principles of refactoring?  (As you would 
  describe it to a 161 student?)
* What do you see as some key techniques for refactoring described or
  used in our textbook?

What is refactoring?

* A set of techniques for rewriting your code without changing its
  functionality in order to make it easier to read/maintain/update.
* Often phrased as step-by-step instructions.
* Often done in response to categories of problems in the code
  ('code smells').

What are some techniques?

* DRY out your code.  If you have repetitious code, write a general
  function/method that encapsulates the commonality.
* Replace methods with method objects.  (Move the local variables in
  the method to object fields so that they can be shared between 
  different methods.)
* Use meaningful variable names.
* Replace magic numbers with symbolic constants.
* Decompose conditionals: If you have complicated if-else statements,
  turn consequent/alternate into separate methods.

Other issues

* Identify smells by looking at the complexity of the control flow;
  simplify the complexity of the control flow.
    * Not always possible

Sam's critique/commentary

* The taxonomy of smells/techniques exists for a few reasons
    * It helps less good programmers improve their code as they
      build the skills to find smells by themselves.
    * It helps experienced programmers think more broadly about
      ways to improve their code.
    * It gives us a vocabulary to talk about improvements.

What are your common techniques for improving your own code? (Yes, they
could match the ones that they suggest in the book.)

* Name your magic numbers.  (In fact, never put magic numbers in your
  code in the first place.)
* Look for repeated code and write a common procedure.  (Better yet, 
  whenever you code by copy-and-paste, write a general function.)
* If a code file gets too long, think about separating it out into
  separate files.
* Profile your code and attack the slow code.
* Rewrite procedures from scratch once you've written them once b/c
  you understand the problem better and are likely to write a more
  elegant solution.
* If code is longer than a certain length, try to break it into multiple
  procedures (if it makes sense to do so).
* If you have multiple parameters, turn them into an object/struct.
* Use appropriate conditionals for the situation.
    * (if x #t #f) => x
    * cond rather than multiple ifs.
* Use iterators or map or for-each or the equivalent rather than a loop
  or recursion.
* Use loops when you have repeated identical code.
* Whatever you do, do it sensibly.
* Peer review!

Questions

* If these are common patterns, are there ways to have programming
  structures (meta programming?) that help with them?
    * Yes.  We've seen some mechanisms in Ruby (e.g., `attr_reader`)
      in Java (e.g., iterators), in functional languages (e.g., hops)

Detour on Old-School Computerized Language Translation
------------------------------------------------------

* English -> Russian -> English
* Original: "The spirit is willing, but the flesh is weak."
* Result: "The vodka is good, but the meat is rotten."

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
  def self.calculate_current_year(days_since_origin)
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
    end
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

What do you see as the strengths and weaknesses of each strategy?

* The CSC 321 version is a bit more compact.  It also uses more of a
  functional model.
* The SaaS version is a bit more object-oriented.
* We haven't been as careful about naming things.  We should probably   
  name the 1980.  We might want to rename the d and convert to things
  like days_since_the_start_of_time and current_year.
* For the constant, it's nice to put the "settings" at the start of
  your class.
* We maintained the same interface, which may be necessary if we have
  lots of clients.
    * We could have maintained `convert` as deprecated and also added
      the other oen.
* The SaaS one uses more of the Ruby syntax.
* How long should a variable name be?
* days_since_origin is a bit weird, since it's not clear whether the
  origin is January 1, 1980 (logical) or December 31, 1979 (the way
  it seems to be implemented)
* Their code is still buggy, but that's intentional.

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

Our improvements.

* The case statement probably belongs in its own function, which
  should be in the Rental class.
* The rewards belongs in a separate procedure.
* Rename the constants (or revalue the constants).
* Separate the computation of the frequent renter points.
* Fix the magic numbers.

<pre class="programlisting">
class Movie
  REGULAR = :regular
  NEW_RELEASE = :new_release
  CHILDRENS = :childrens
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
  def price
    rental_price = 0
    case element.movie.price_code
    when Movie::REGULAR
      rental_price += 2
      rental_price += (element.days_rented - 2) * 1.5 if element.days_rented > 2
    when Movie::NEW_RELEASE
      rental_price += element.days_rented * 3
    when Movie::CHILDRENS
      rental_price += 1.5
      rental_price += (element.days_rented - 3) * 1.5 if element.days_rented > 3
    end
    rental_price
  end

  def points
    if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1
      2
    else
      1
    end
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
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      this_amount = 0

      # determine amounts for each line
      this.amount = element.price

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  def frequent_renter_points
    @rentals.inject(0) { |result,element| result + element.points }
  end

  def total_amount
    @rentals.inject(0) { |result,element| result + element.amount }
  end

end
</pre>

