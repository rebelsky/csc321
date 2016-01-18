CSC321.01 2015F, Class 08: Test-Driven Development and Code smells
==================================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
* Review: Buggy code.
* Loop invariants.
* Code smells.
* Test-driven development.
* Code coverage.
* Work time.

Preliminaries
-------------

### Admin

* Welcome back!  I hope you had a good break.
* Most of you seem to have done the reading journals for this week,
  but not necessarily the programming assignment.  We'll probably use
  the second half of class for you to make progress on the programming
  assignment.
* Reading HW for Monday Nov. 2
    * Section 9.5, Chapter 5
* Programming HW for Monday Nov. 2
    * <https://github.com/saasbook/hw-bdd-tdd-cycle>
    * Use `hw-bdd-tdd-cycle` when you clone
* Programming HW for Monday Nov. 9
    * <https://github.com/saasbook/hw-oracle-of-bacon>
* I don't seem to have the second half of the course up yet; I'm waiting
  for the folks at EdX to post it.  

Review: Buggy code
------------------

<pre>
class TimeSetter
  def self.convert(d)
    y = 1980
    while (d > 365) do
      if ((y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0)))
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

What does this program try to do?

* Given the number of days since January 1, 1980, figure out what day
  of the latest year it is

What is wrong with this program?

* If it's day 366 of a leap year, loops forever

How would we find it?

* Loop invariants
* Unit tests
    * Frameworks for making sure that your tests are good
* Code smells - Bad design decisions all over the place

How would we fix it?

* Use library code!  But this might even be library code.
* Sometimes you should throw away broken code and start from scratch.
* Don't make it more complex!

<pre>
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
</pre>

Loop invariants
---------------

A technique for developing correct loop code and think through what your
code does.

Three parts

* A useful true statement about the state of the system (i.e., the values
  of variables) at the start of every repetition of the loop
* A condition for terminating the loop
* At every iteration we get closer to the termination condition.

Note:

* We need to make sure that the statement holds at the beginning.
* When we know that it holds after the loop is finished, we know something
  useful about the state of the system.

As we write any algorithm, it's useful to know what all the variables
represent.

Code smells
-----------

* Postponed

Test-driven development
-----------------------

* Important issue: Write the tests first
* The tests give you the specs of what you have to do; so you aren't
  inclined to make your code do too much work.  
    * That may not be the best strategy, you may eventually have to
      think about a broader scope.
    * Through practice you get good at deciding when general code is
      better and when "meet the minimum requirements" is better.
* Encourages you to think about edge/corner cases before your brain is
  corrupted by writing the code.
* Not biased by your particular implementation.
* Gives you quick feedback on whether your code is working.
* Gives you a goal to work toward.  (Coding as video game.)
* Lets you think both at a more granular level and a broader level.
* Lets you catch errors earlier, and lets you know *where* your errors
  are.
* "It's fun."
* Can help you think more about your code; makes it easier to solve problems;
  stops you from going down bad directions.
* Gives you cleaner code.
* Gives you confidence that your code is correct.  (Formal proofs using
  loop invariants give you even better confidence.)
    * It's better than "I tried a few cases and it seems to work."
* No one wants to write tests or documentation after they code.
* Tests are one way of specifying desired behavior.  (It's a runnable
  specification.)
* Gives you freedom to experiment with other implementations!

Pure TDD

* Write one test
* Write the code to pass that test
* Write the next test
* Update the code to pass both tests
* Write the next test
* Update the code to pass all three tests
* ...

Reality

* Write many tests
* Write code that passes those tests
* Write more tests
* Update the code to pass all tests
* ...

Code coverage
-------------

* At some point, tests need to be tied to the particular code they are
  testing, and not just the expected overall behavior.
* Good test suites do code coverage.
* We should make sure that  some test executes every line of code at
  some point.
* What's the difference between branch coverage and path coverage?
    * Just hitting every statement (and every branch) vs. making
      sure we've seen different paths of control flow.
* Good test systems provide some form of code coverage testing.
    * Loops and code coverage are therefore approximate
* Conventions
    * Hit n% of the likely paths
    * Ratio of tests to code (2:1)

Work time
---------

