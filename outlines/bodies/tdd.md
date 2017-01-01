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
    return [y,d]
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

Global Surveillance
-------------------

"I would like to discuss the idea of global surveillance and where to
draw the line.  It's a grey area for me and I'd like to get more opinions
on it."

* Arguing for as much surveillance as possible: MG, CG, NT, AH, SH, YL,
  EZ, GN
* Arguing for a moderate position: ST, RW, BR
* Arguing for none whatsoever: Everyone else.


