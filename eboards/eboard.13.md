CSC321.01 2016S, Class 13: Test-Driven Development
==================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Review: Buggy code.
* Loop invariants.
* Code smells.
* Test-driven development.
* Code coverage.

Preliminaries
-------------

### Admin

### Upcoming Work

* A bunch of articles for Wednesday
    * Don Gotterbarn, Keith Miller, and Simon Rogerson (October 1999). Computer Society and ACM approve Software Engineering Code of Ethics. IEEE Computer 32(10): 84-88.  <https://www.computer.org/cms/Computer.org/Publications/code-of-ethics.pdf>
    * Peter G. Neumann (February 2015). Inside Risks: Far-sighted thinking about deleterious computer-related events. CACM 58 (2): 30-33. <http://www.csl.sri.com/users/neumann/cacm235.pdf>
    * ACM Council (October 1992).  ACM Code of Ethics and Professional Behavior. <http://www.acm.org/about/code-of-ethics/>
* Reading Journal for Wednesday (due Tuesday at 8pm)
    * Subject: Reading Journal for Class 14 (Your Name)
    * What was the most familiar idea in today's readings on ethics? Where had you seen that idea before?
    * What surprised you the most in today's readings on ethics? Why was that idea surprising?
    * Are there ways in which agile practices help support ethical behavior or make it more difficult?
    * Any other reactions or points you would like to discuss?
    * These questions were inspired by the work of JLND

### Good Things to Do

#### Academic

* Misc. department stuff
* Sexual Assault Awareness Week Discussion, Monday, 7:30 pm JRC 101
* CS Table, Noon, Tuesday, White PDR.
* State of SHACS Discussion, Tuesday, 7pm JRC 209
* Town Hall, Wednesday, noon or 7:30 pm (I think) JRC 101
* CS Extras Thursday (?)
* GCStuACM after CS Extra

#### Peer

* Social Dance Workshop Tuesdays 7:00-8:00 in Bucksbaum Dance Studio
  (peer like)
* Campus Council Discussion Wednesday at 8pm in JRC ??? on how to
  spend half a mil.

### Questions

Refresher: Incorrect code
-------------------------

* What does this code try to do?
* What tests would you run?
* (Optional) What's wrong with this code?

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
    return (y,d)
  end
end
</pre>

What does this code try to do?

* Given a number of days since the start of time (January 0, 1980), find
  the current year and current day of the year.

How would you check whether the code is correct, assuming it compiles?

* Pick a starting number and an expected ending rule and step through
  the code (perhaps by hand, perhaps with a debugger).
* Pick a random sampling of dates since the start of time, figure out the
  correct value, plug it back in, and see that you get the same date.
  (Unit tests.)
* Loop invariants!

Suppose we are running unit tests, what tests would you run?

* January 1, 1980, to make sure that it doesn't screw up there.  Pass!
* December 31, 1980, to make sure that it doesn't screw up there.
* January 1, 2080, because we know Microsoft products are expected
  to work for a century.
* December 31, 2000, because leap years (or non leap years) are complicated
* December 31, 1999.  Millenium bug.
* January 1, 2000.  Millenium bug.

(Optional) What's wrong with this code?

Loop invariants
---------------

* The CSC207 part of my brain wants you to fix this with loop invariants.
* So let's remember what loop invariants are.  
    * Something that doesn't change throughout the loop.
    * More precisely, something we know that will hold at the end of the
      loop provided it holds at the beginning of the loop, so each time
      we run the code in the loop, we preserve that knowledge.
    * Helps us know that the code is correct.
* Three main aspects.
    * Invariant
    * Termination condition
    * Gets closer to the termination condition at every repetition of the
      loop.
* How would the help with this program?

Code smells
-----------

What about that code might have raised concerns, even before the tests
never completed?

* Way complicated code for testing for a leap year.
* A loop without a corresponding invariant.
* One-letter variable names.
* Comments?  What comments?
* Repetitious code.
* Nested conditionals.

Fixing the Code
---------------

First attempt

<pre>
class TimeSetter
  def self.convert(day_in_year)
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (day_in_year > 365) do
      day_in_year -= 365
      # There's an extra day in a leap year!
      if (isleapyear year)
        day_in_year -= 1
      end
      year += 1
    end
    return (year,day_in_year)
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>

* Whoops!  We're checking whether the wrong year is a leap year.
  (Fixed in code above.)
