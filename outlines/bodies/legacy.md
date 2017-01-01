Preparatory Activity
--------------------

On a sheet of paper (supplied), answer the following questions.

0. What is one compelling point for your side in the global
   surveillance "debate"?
1. What is "legacy code"?  (We see lots of definitions within the
   chapter.)
2. List three "code smells" that you regularly notice.
3. What is SOFA?
4. List three refactoring techniques that you regularly use.

Global Surveillance
-------------------

"I would like to discuss the idea of global surveillance and where to
draw the line.  It's a grey area for me and I'd like to get more opinions
on it."

* Arguing for as much surveillance as possible: MG, CG, NT, AH, SH, YL,
  EZ, GN
* Arguing for a moderate position: ST, RW, BR
* Arguing for none whatsoever: Everyone else.

Legacy Code
-----------

* What, from your perspective, is "legacy code"?  (We see lots of
  definitions within the chapter.)
* Why do we care about it?
* What kinds of maintainance do we worry about for legacy code?
* How do we do this kind of maintainance?

Code Smells
-----------

* What are they?
* Why do we care?
* What are some useful smells to look for?
    * SOFA (or the inverse thereof - LMMC)
* What are smells that *you* look for?
* How do we make things smell better?

Refactoring
-----------

* What do you see as the key principles of refactoring?
* What do you see as the key techniques we use to refactor?
* Sam's perspective: There are a few purposes for the list of
  refactoring techniques.
    * They serve to remind programmers of the kinds of things they
      can do to make code better.
    * They provide us with a *vocabulary* to talk about the kinds of
      changes you might make to a program.
* You should be experienced enough as programmers to have your own list
  of common "code improvements".  What are some of yours?

An Example
----------

We'll continue our example from last class.  What "smells wrong"
in this example?

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

Another Example
---------------

From Fields et al., _Refactoring: Ruby Edition,, pp. 2-4.

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
