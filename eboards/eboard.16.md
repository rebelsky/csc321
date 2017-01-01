CSC321.01 2016F, Class 16: Legacy Code
======================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Global surveillance.
* Legacy code.
* Smells and refactoring.
* Some examples.

Preliminaries
-------------

### Admin

* Friday PSA!

### Upcoming Work

* More work for Monday: Find code smells and possible improvements in
  the program at the end of this page.
* Readings for Monday.
    * Arvind Narayaan and Shannon Vallor (March 2014). Why software engineering courses should include ethics coverage. Communications of the ACM 57(3): 23-25. <http://dl.acm.org/citation.cfm?id=2566966>. Neil McBride (August 2012). 
    * The ethics of software engineering should be an ethics for the client. Communications of the ACM 55(8): 39-41. <http://dl.acm.org/citation.cfm?id=2240250>.
    * Deborah G. Johnson (October 2008). Computer experts: Guns-for-hire or professionals? Communications of the ACM 51(10): 24-26. <http://dl.acm.org/citation.cfm?id=1400190>.
* Reading Journal for Monday (due Sunday at 11pm)
    * Subject: Reading Journal for Class 17 (Your Name)
    * From each of the three new articles about software engineering ethics, select one sentence that you think best captured its thesis. Quote that sentence, giving a page number and approximate location on the page (e.g., "top right").
    * What is one question arising from these articles that you'd like to discuss during class?
    * Brainstorm a few topics or questions that you might address in a 600-word essay on software engineering ethics (the last assignment). Your ideas might arise from the articles or from current events.
    * _As is often the case, these questions were inspired by the work of JLND._

### Good Things to Do

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Lynda Barry workshop, 4pm-7pm tonight.
* CS Picnic tonight.
* Lots of sporting team events tomorrow.
* Grinnell Prize Events next week.  (Too many to list right now.)
* CS Table next week.
* Sandlot movie tonight in Field House at 8pm.
* Weird biopic day Wittgenstein and The Scarlet Empress, 1pm in Harrisck
* N gets lonely.  Visit him 3-6 pm while he's working.
* Tickets on sale for Laramie Project.
* Design a CS Pub Quiz!

### Questions

Preparatory Activity
--------------------

On a sheet of paper (supplied), answer the following questions.

-1. What is your name?
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
on it." - Intelligence gathering by governments for people both within
and without their territory.  The government having access to information
about you (where you are, what you're doing, what Web sites you visit,
basically what Google and your cell phone manufacturer know).

* Arguing for as much surveillance as possible: MG, CG, NT, AH, SH, YL,
  EZ, GN
* Arguing for a moderate position: ST, RW, BR
* Arguing for none whatsoever: MG, MH, AF, JE, ZS, ZN, JC, BM, CS

We are better able to catch terrorists if we gather information about
as many people as we can and process it automatically.

* Even if we catch terrorists, we might also have the information hacked
  and made available to even worse terrorists.

If we are observing people, we are likely to start penalizing them, and
people should only be penalized for actions, not thoughts.

---

Allows us to effectively commit murderers and to reduce incorrect
convictions.  Allows us to eliminate biases.

* Unfortunately, little of the data are kept.

Counterpoint: Rodney King.

Midpoint: With guidelines.

Some folks will be better able to protect themselves from surveillance.
It means that your vulnerability to surveillance is likely inversely
correlated with SES.

[Sam is giving up trying to record this debate.]

Legacy Code
-----------

* What, from your perspective, is "legacy code"?  (We see lots of
  definitions within the chapter.)
* Why do we care about it?
* What kinds of maintainance do we worry about for legacy code?
* How do we do this kind of maintainance?

Code Smells
-----------

* What are they?  Common ways of writing code that usually indicate
  that the programmer is not thinking very deeply about the problem.
* Why do we care? If the programmer isn't thinking carefully, they are
  probably making mistakes.
* What are some useful smells to look for?
    * SOFA (or the inverse thereof - LMMC)
    * Small Procedures, One Purpose, Few Parameters, uniform Abstraction

Your favorite code smells.

* Bad variable names, such as many one-letter variable names.
        int str;
        int array;
        int foo;
        int bar;
        int baz;
        int qux;
* Lack of documentation (e.g., need at least simplified six P's).
* Variable that is used exactly once.
        int len = length(arr);
        if (len == 0) { ... }
* Deeply nested loops, which will be hard to trace.
    * Particularly when people put arbitrary "break" statements in the
      middle of the inner loop.
* Magic numbers.  Numbers that you can't always tell their purpose.
    * May not be obvious to everyone.
    * When you have to change them, it may be that the same number
      means multiple things.

                int a[10];
                ...
                for (i = 0; i < 10; i++) {
                  if (a[i] >= 10) {
                    ++out_of_range;
                  }
                }

                int a[MAX_ARRAY];
                ...
                for (i = 0; i < MAX_ARRAY; i++) {
                  if (a[i] >= MAX_GRADE) {
                    ++out_of_range;
                  }
                }
* Lots of parameters.  Condense into an object.
    * Example: Pulling a lot of data from a table, and then passing it
      around.  It's much easier to do it with an object, rather than
      N different fields.
* Similar classes that don't take advantage of inheritance and polymorphism.
    * One of the many examples of not-DRY code.
    * Use inheritance to make it dryer.
* Nested ifs when you should be using `cond`.  More generally, deep
  conditionals.
* Really long functions.  Break them down into smaller functions.
* Signs of poor memory management, such as no calls to `free` until the
  end of the program.
* Repeated code, apparently created by copy/paste/change.
     * Often, write a general method/function.
* Poorly indented code, or code that does not follow the house style,
  or inconsistent style.
     * Use the auto-indent in your proramming environment.
* Bad program management strategies, such as mediocre use of your version
  control system.
* Lots of code intended for special cases.
     * Throw it all away and start again.
* Stupid if statements

        if (test) {
          return true;
        }
        else {
          return false;
        }

        return test;

        if (test) {
          return false;
        }
        else {
          return true;
        }

        return !test;

How do we make things smell better?

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
