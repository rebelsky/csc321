CSC321.01 2016F, Class 15: Test-Driven Development
==================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Review: Buggy code.
* Loop invariants.
* Surveillance.

Preliminaries
-------------

### Admin

### Upcoming Work

* Readings for Friday: SaaS 9, 10.4-10.8.
* Reading Journal for Friday (due Thursday at 11pm)
  [_As is often the case, these questions were inspired by the work of JLND._]
    * Subject: Reading Journal for Class 16 (Your Name)
    * How does the description of Software Maintenance reflect your own expectations or experiences about such issues?  What was familiar?  What was surprising?
    * What is the most important thing you learned from Chapter 9, Software Maintenance (textbook or videos)?
    * What was the muddiest point from this material? Explain that idea in your own words as best you can.
* Discussion of the role of ethics in Grinnell's CS curriculum on Monday.
* 600-word ethics essay, informed by these papers and the next set,
  Due Friday, November 4.

### Good Things to Do

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Jiu Jitsu tonight at 6:30 p.m. at Dance Studio in Natatorium.
* Convocation tomorrow.
* CS Pic-i-nic Friday at 5pm at Merrill Park West (11th and Main).

### Questions

Refresher: Incorrect code
-------------------------
What does this program try to do?

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
    return [d,y]
  end
end
</pre>

What does this program try to do?

* Find the year (and day within the year), based on the number of days
  since the start of time (January 0, 1980).
* Precondition: The number of days is a positive integer.
* Question about the goal: For the 365th day of the year, do we want
  [365,Y] or [0,Y+1].  The former.

What tests would you run?

* convert(730) = [364,1981]       // 
* convert(365) = [365,1980]       //
* convert(1) = [1,1980]         // Edge case
* convert(366) = [366,1980]     // Edge case
* convert(367) = [1,1981]       // Edge case
* convert(731) = [365,1981]
* convert(732) = [1,1982]
* convert(1096) = [365,1982]
* convert(366+365+365+365+366+1) = [1,1985]

* Code coverage ...

What is wrong with this program?

* Runs forever when you do the last day of a leap year.

How would we find it?

* Unit tests.

How would we fix it?

* "Insert print statements" NO / "Use a debugger" YES
* Document

<pre>
class TimeSetter
  def self.convert(d)
    // Set y to the start of time
    y = 1980
    // As long as we are beyond the end of the year
    while (d > 365) do
      // If it's a leap year
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        // And there are enough days left in the year
        if (d > 366)
          // Move on to the next year
          d -= 366
          y += 1
        end
      else
        // Move on to the next year
        d -= 365
        y += 1
      end
    end
    return [d,y]
  end
end
</pre>

* Manual inspection.
* Loop invariant - Well written loop invariants help you ensure that
  your loops are correct.
* Trace through the example

Loop invariants
---------------

* The CSC207 part of my brain wants you to fix this with loop invariants.
* So let's remember what loop invariants are.  Three main aspects.
    * The invariant: Something that's true at the start of each iteration
    * Termination condition: When you stop.
    * "Measure of size": A way of ensuring that the program stops.
* How would the help with this program?

<pre>
class TimeSetter
  def self.convert(d)
    // Let Y be 1980 and D be the initial value of d
    y = 1980
    // Invariant: Day D of 1980 is equivalent to day d of y.
    // "Size": d
    while (d > 365) do
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        if (d > 366)
          d -= 366
          y += 1
          // Maintains invariant
          // Shrinks d
        end
        // Maintains the invariant
        // DOESN'T CHANGE d
      else
        d -= 365
        y += 1
        // Maintains invariant
        // Shrinks d
      end
    end
    return [d,y]
  end
end
</pre>

FIX IT!

<pre>
class TimeSetter
  def self.convert(d)
    y = 1980
    while (d > 365) do
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        if (d >= 366)
          d -= 366
          y += 1
        end
      else
        d -= 365
        y += 1
      end
    end
    return [d,y]
  end
end
</pre>

* Nope!  convert(366) gives [0,1981] rather than [366,1980]

<pre>
class TimeSetter
  def self.convert(d)
    y = 1980
    while (d > 365) do
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        if (d > 366)
          d -= 366
          y += 1
        else if (d == 366)
          return [d,y] // UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH  UGH 
        end
      else
        d -= 365
        y += 1
      end
    end
    return [d,y]
  end
end
</pre>

* Breaks in the middle of loops are generally an indication that you
  are unable to design clean code.

<pre>
class TimeSetter
  def self.convert(d)
    y = 1980
    while (d > 366) do
      if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0))
        d -= 366
        y += 1
      else
        d -= 365
        y += 1
      end
    end
    return [d,y]
  end
end
</pre>

* Doesn't work for non-leap years.

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
    return [d,y]
  end
end
</pre>

<pre>
  while (d > daysInYear(y)) {
    d -= daysInYear(y);
    y += 1;
  }
  return [d,y]

  def self.daysInYear(y) {
    if ((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0)) {
      return 366;
    }
    else {
      return 365;
    }
  }
</pre>

Global Surveillance
-------------------

"I would like to discuss the idea of global surveillance and where to
draw the line.  It's a grey area for me and I'd like to get more opinions
on it."

* Arguing for as much surveillance as possible: MG, CG, NT, AH, SH, YL,
  EZ, GN
* Arguing for none whatsoever: Everyone else but SS
* Arguing for a mdoerate position: ST, RW, BR


