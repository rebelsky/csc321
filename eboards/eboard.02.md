CSC321.01 2015F, Class 02: An Introduction to Software Engineering and SaaS
===========================================================================

_Overview_

* Meta-work: Reflecting on the Semi-Flipped Classroom
* Software Engineering, SaaS, and Such
* Reflecting on the Readings
* Experiences with Ruby
* User Stories
* User Stories Exercise
* Work Time

Preliminaries
-------------

### Admin

* Attendance.
* Don't forget that we have a new MOTD system.  Read them.  RG worked really
  hard on them.
* I'm going to put you in teams of about three students for the first half
  of class.  I'll put you in pairs for the second half of class.  Be prepared 
  to move!
* Sorry for any confusion about submission and such.  I'm still working on
  mastering a new teaching platform and style and finding time to get everying
  in place.
    * Work that I see gets submitted via email: Journals, 
      Code (after autograder)
    * Due dates are in UTC!
* There were some concerns about the autograders.  We'll consider those
  during class time.
* This week's "transition hiccup": The RSpec files for HW1 did not seem to
  work under the Ruby and RSpec on Cloud 9.  I've forked the assignment
  files and the new version seems to be working okay.
* I misread my schedule for today, and did not have a chance to read all of
  your homeworks and reflections.  I'll work from what I read, and encourage
  you to also discuss/ask further.

### Questions

The Semi-Flipped Classroom
--------------------------

* What was your experience working in this different model of class?
* Positives?
    * Make your own schedule; can move faster if necessary, can move slower
      if necessary; can do it during downtime
    * Watching videos and taking notes works really well for some people
    * New and shiny!
    * Seeing the list on the left is really useful.
* Negatives?
    * Not enough time / too much work!
    * CodeCademy doesn't have shortcuts for "I know this; don't make me
      type stupid code."
        * Moral: Learn how to skip things in your online learning system.
        * Moral: People should design tutorials for competent programmers,
          or instructors shoudl find them.
    * Each piece had a little hidden part - such as a one-point quiz.
    * Lots of switcing between environments - PITN
* What were your experiences with the autograder?
    * Nice to be able to resubmit multiple times and get feedback about
      things you might not have thought about.
    * Cruel and harsh
    * Sometimes check for things that you didn't know were required
        * Philosophy: The tests *are* the requirements
* Text?  Video?  Both?  Neither?
    * Video can be a good alternative to text
    * But more time onscreen is not great

Software Engineering
--------------------

* Relationships between Plan and Document and Agile?
    * Similarities?
       * Both are iterative - Go through the steps multiple times
       * Gather requirements; Make code; Test
       * Both get input from users, typically at the start of an
         iteration
    * Differences?
       * Agile gets you to something that "works" much quicker
    * Iteration
        * Agile has test before code
        * P&D often has test after code
* What do you see as the main steps in one iteration of waterfall, spiral,
  and agile (or at least XP-style agile)
    * Waterfall: Gather requirements from client; create architecture;
      implement; verify; deploy/mainatin
    * Spiral: Gather requirements; evaluate risks; develop; plan; 
        * Seems to separate a lot of planning - perhaps different kinds
    * Agile: Evaluate/Gather requirements from client; create preliminary
      plans; write tests; implement - following particular pratices;
      reschedule if necessary, iterate
* Important agile practices (primarily that support better architecture)
    * Pair programming - Cuts errors, multiple designs developed and
      discussed; interacting with other people; focus on real work;
      can be faster - helps identify structural problems faster;
      If you rotate partners, you get a sense of the broader project
    * User stories - Helps make sure that you achieve the right thing
    * TDD - Lets you meet the requirements, Makes it safe for you to 
      experiment with new designs
    * Refactoring
* Key terms: SaaS, Service-Oriented Architecture, Cloud
    * How would you describe each of them to someone who had not
      heard them before?
* Software as a Service - Software lives on "the web" and not on your
  device.  (Can be enabled by "the cloud")
    * Benefit: Users don't have to update anything
    * Alternate: Software lives on a central machine and is run from
      there.
    * Note: It may still run on your device, and download stuff to your
      device.
* SOA - Service-Oriented Architecture - 
    * Example: Google doc - Divvying up responsibilities in an application
      The things don't have to be interconnected.  Each service maintains
      a separate part of the application through an interface.
    * A non-SOA architecture: The operations are at a higher level of
      service.  E.g., instead of talking directly to a database, you 
      talk to something that is using the database.
    * There is a common mechanism through which things can talk to each
      other.
* "The Cloud" - Shared computing resources that you can access - processors,
  storage, database servers, etc.
    * With redundancy
    * Yay informal terminology!

Thoughts from the Readings
--------------------------

Three things that you were excited about after doing these readings and
exercises.

* "I was excited to see how many software projects fail.  That means that
  standards are low, and I can succeed."
* "I was excited to see a lot of buzzwords, which means that I can 
  participate in conversations with professionals."
* "We get to learn a new programming language that is significantly
  uglier and no more powerful than Scheme.  (But with an awesome 
  community.)"
* Learning good ways to make software.
* Thinking about meeting customer needs (really 322)
* Getting more comfortable with TDD - We keep talking about it, but we
  don't do enough of it.
* Thinking about legacy code and beautiful code.
* Thinking about tools for dealing with large code base projects.
* SCRUM

Experiences with Ruby
---------------------

We'll first consider some of your programs.

_How did you solve: (a) `sum_to_n`_

    def sum_to_n?(vals,val)
      vals.combination(2).each {|x,y| if (x+y) == val return true}
      return false;
    end

    def sum_to_n(vals,val)
      sums = Hash.new{0}
      vals.each do |x|
        vals.each do |y|
          if (x!=y) then
            sum = x+y
            sums[sum] += 1
          end
        end
      end
      return sums[val] > 0
    end

    # Will this work for `sum_to_n?([7,7], 14)`?  No.
    # What does "distinct values" mean?  Yay vague specs!

    def sum_to_n(vals,val)
      for i in 0 ... vals.length
        for j in i+1 ... vals.length
          if vals[i]+vals[j] == val
            return true
          end
        end
      end
      return false
    end

    def sum_to_n?(vals,val)
      nums = Hash.new(false)
      vals.each {|x| nums[x] = true}
      vals.any {|x| (nums[val-x]) }
      return false;
    end

    # Returns true for `sum_to_n?([6],12)`
    # But it's O(n), which is great

_How did you solve: (b) `multiple_of_4?`_

    Make sure that it's not the empty string
    Make sure that it contains only 0's and 1's by checking whether length
      = #0's + #1's
    Convert to an integer and see if it's divisible by 100

    /^[01]+$/.match(str) # is it all 0's and 1's
    if /[^01]/.match(str) return false

    str.to_i(base=2)
    str.to_i(2)

    /^[01]*00$/.match(str) || /^0$/.match(str)

_How did you solve: (c) `starts_with_consonant?`_

    # Get the ASCII value of each letter and check for non-letters

    # Alternate
    if (!/^[[:alpha:]]/.match(str)) return false
    return !(/^[^aeiouAEIOU]/.match(str))
    return !(/[^aeiouAEIOU]/.match(str[0]))

    tmp = str.downcase.capitalize  
    if (tmp == nil) return false
    return ['A','E','I','O','U'].contains(tmp[0])

We'll then consider some general issues.

_Nope, didn't get to this_.

* What did you see as high points?
* What did you see as familiar?
* What did you see as potentially problematic?

User Stories
------------

_Nope, didn't get to this.  Moved to 322._

* What are they?
* How do we build them?
* How do we use them?

User Stories Exercise
---------------------

_Nope, didn't get to this.  Moved to 322._

_You are building the Grinnell online teaching system (GOTS) for the Ruby 
programming language_

* Whole group question: Who are your audiences?
* We will break into individual groups to conduct user interviews.  NBB
  and I will simulate certain kinds of users.  Others of you will have to
  simulate others.
* We will come back together with the stories we have gathered.
* Strive for relatively narrow stories.  Not "As a student, I want to
  learn."

Work Time
---------

_Hah!  We didn't have time for work time._

_Start looking at HW1 with your partner._
