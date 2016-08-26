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
  end
end
</pre>

What is wrong with this program?

How would we find it?

How would we fix it?

Loop invariants
---------------

* The CSC207 part of my brain wants you to fix this with loop invariants.
* So let's remember what loop invariants are.  Three main aspects.
* How would the help with this program?

Code smells
-----------

* What are they?
* Why do we care?
* What are some useful smells to look for?
    * SOFA (or the inverse thereof - LMMC)
* What are smells that *you* look for?
* How do we make things smell better?

Unit testing
------------

* Why?
* How?
* Your notes:

Code Coverage
-------------

* Basically: How much of the code that we've written actually gets touched
  by our tests.
