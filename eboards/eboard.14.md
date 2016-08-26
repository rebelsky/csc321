CSC321.01 2016S, Class 14: Codes of Ethics
==========================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Ugly Code, Revisited.
* Professional Codes of Ethics.
* Comments From Students.
* Agile and Ethical.

Preliminaries
-------------

### Admin

### Upcoming Work

* SaaSbook 9 for Friday.
* Reading Journal for Friday (due Thursday at 8pm)
    * Subject: Reading Journal for Class 15 (Your Name)
    * How does the description of Software Mainenance reflect your own expectations or experiences about such issues?  What was familiar?  What was surprising?
    * What is the most important thing you learned from Chapter 9, Software Maintenance (textbook or videos)?
    * What was the muddiest point from this week's material? Explain that idea in your own words as best you can.
    * These questions were inspired by the work of JLND.

### Good Things to Do

#### Academic

* Town Hall, Tonight 7:30 pm JRC 101
* CS Extras Thursday (?)
* GCStuACM after CS Extra

#### Peer

* SGA Meeting tonight!  8:30pm JRC 209.

### Questions

Ugly Code, Revisited
--------------------

<pre>
class TimeSetter
  def self.convert(daysleft)
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (daysleft > 365) do
      daysleft -= 365
      # There's an extra day in a leap year!
      if (isleapyear year)
        daysleft -= 1
      end
      year += 1
    end
    return (year,daysleft)
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>

This is still wrong.  Why?

* `daysleft` is a bad name for the parameter, since that's not
* The 366th day of 1980 gets converted to the 0th day of 1981, when
  it really should be the 366th day of 1980. (December 31, 1980.)
  what it represents.

Fix?

* Maybe the while?  Maybe the if-else?
* Maybe throw it all away and start from scratch?

<pre>
class TimeSetter
  def self.convert(days_since_start_of_time)
    daysleft = days_since_start_of_time
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (daysleft > 365) do
      daysleft -= 365
      # There's an extra day in a leap year!
      if (isleapyear year)
        daysleft -= 1
      end
      year += 1
    end
    return (year,daysleft)
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>


Approach one: Adding the code

        if daysleft > 0
          ++year
        else if (is_leap_year year)
          daysleft = 366
        else
          daysleft = 365
        end

<pre>
class TimeSetter
  def self.convert(days_since_start_of_time)
    daysleft = days_since_start_of_time
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (daysleft > 365) do
      daysleft -= 365
      # There's an extra day in a leap year!
      if (isleapyear year)
        daysleft -= 1
      end
      if daysleft > 0
        ++year
      else if (is_leap_year year)
        daysleft = 366
      else
        daysleft = 365
      end
    end
    return (year,daysleft)
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>

* Boy this code is hard to read.  If the day in the year is 0, then
  it should be the last day of the current year.
    * Whoops.  We're back to looping forever.
* Two identical tests in almost immediate succession.
* Code that can never be executed.

Figure out a loop invariant (a statement about the status of the
system that you can guarantee is true at the end of the loop if it's
true at the beginning of the loop, and that is helpful in achieving
the goals of the program.)  

* 0 <= daysleft 
* daysleft days since January 0, year is the same as
  days_since_start_of_time since January 0, 1980.

Another solution: In the while loop, do a more careful test

<pre>
class TimeSetter
  def self.convert(days_since_start_of_time)
    daysleft = days_since_start_of_time
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (daysleft > 365) do
      if (is_leap_year year && daysleft >= 366)
        daysleft -= 366
        year += 1
      else if (is_leap_year year)
        break out of the loop;
      else
        daysleft -= 365
        year += 1
      end
    end
    return (year,daysleft)
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>

* It's not intuitive, even though it may be functional. 
* It's hard to read quickly.
* We're hardcoding something special for one case.
* Maybe we should move things outside of the loop.
* Two nearly identical calls to is_leap_year in a row seems wasteful
* Two nearly identical bodies
* Breaking out in the middle of a loop is sometimes dangerous

<pre>
<pre>
class TimeSetter
  def self.convert(days_since_start_of_time)
    daysleft = days_since_start_of_time
    year = 1980
    # Keep moving into the next year until we are down
    # to a reasonable number of days
    while (daysleft > (daysinyear year))
      daysleft -= (daysinyear year)
      year += 1
    end
    return (year,daysleft)
  end

  def self.daysinyear(year)
    if (isleapyear year)
      return 366
    else
      return 365
    end
  end

  def self.isleapyear(year)
    return (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);
  end
end
</pre>

* Crappy naming (fixed)
* Repeated computation (can be fixed)
* But much clearer

Professional Codes of Ethics
----------------------------

Why do we have professional codes of ethics?

* There are commonly held moral codes.
* Being a professional means being held to higher standards.
    * Should share codes.
    * Need to think about how "commonly held" codes might apply 
      in professional situations or might conflict.
    * Lets you have a resource to use when you find breaches of
      ethical conduct.
    * Would like something concrete so that we can agree to it.
    * We would hope that we follow the code.
* For software engineers
    * The growth of computing means that there will be more situations
      that could provide questionable moral/ethical imperatives (e.g., 
      big data) and a clear code of ethics helps us navigate them.
* The first responsibility of a professional is to society and not to
  their client.  Why?
    * The client might desire something that conflicts with the betterment
      of society.
    * We could have evil clients.
    * Chemists (scientists) seem to have a responsibility to consider the
      effects of what they do.  AI researchers have written a statement.
    * Civil engineers, who build bridges and such, must prioritize safety
      of society over the desires of their clients for lowered cost or
      greater aesthetics or ...
    * Some professions may have a primary responsibility to the client:
      Lawyers, lobbyists
    * Some professions the client may be "society"
* Hard questions
    * What if society has different beliefs than you do.
    * We might have a responsibility to understand issues of cultural
      relativity and identify where we fall.
* Examples
    * VM emissions scandal

Comments From Students
----------------------

Agile and Ethical
-----------------

