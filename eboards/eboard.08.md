CSC321.01 2016F, Class 08: User Stories
=======================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* User stories.
* Sample user stories.
* Some Ruby-isms.  (If there's time.)

Preliminaries
-------------

### Admin

* Happy Monday!
* Leftovers!
* I think I fixed the schedule.  I have not yet fixed the CSC 322 Web site.

### Upcoming Work

* For Wednesday: Work on chapter 5 of Hartl.
* For Wednesday: Last chance to catch up on any missing journal entries.
  (No new entries assigned.)
* For Friday: Work on chapter 6 of Hartl.

### Good Things to Do

* Cool concert tomorrow night at 8:00 in Gardner.  
* CS Table Tuesday: Data Privacy and Higher Education
* Spark Tank Tuesday at noon in ARH 102 (I think)
* CS Extras Tuesday: Google!
* Convocation Thursday: Higher Education
* CS Extras Thursday: Internships
* Cool concert Friday at 7:00 p.m. in Sebring-Lewis (Robert Glasper trio).  
  Get there early!
    * There's also a talk.
* Noteworthy concert Saturday at 8:00 or 8:30 or something like that.
* Football home game (again!) Saturday.  They're getting better.
* We need DJs!  Send KDIC an application.  (Sarah would listen to you
  read code on air.)

### Questions

User Stories
------------

What are they?

* A mechanism for understanding user requirements.
* Short snippets that describe software functionality from the
  perspective of a class of user.
* Typically of the form "As a _, I want to be able to do _, so that I
  can _."  (We sometimes reverse those last two clauses.)
* User class/action/goal
* Should be used in development; can also be used for refinement.

How do we build them?

* Talk to our users.
* Attempt to turn what they say into the structured form.
* (Refine to reasonable size.)  SMART
    * Specific
    * Measurable
    * Achievable or Attainable
    * Relevant
    * Time-boxed
* It's okay if you prod the user to come up with stories.
* Reverify them with the user.

How do we use them?

* As a way to communicate with our users.
* As the tasks that we assign each iteration.
* As tests! (Using BDD.)
* To know when we've reached MVP.

Sample Stories
--------------

_These are the stories you submitted.  We'll look over them and think
about whether they meet our goals._

### Set zero

As an alum, I can click a button so that I can give back to Grinnell.

As a student, I can see the college calendar so that I can attend events with alumni.

As a recent grad, I can find the list of resources so that I can stay connected.

* Good: Specifies user, goal, what is necessary.
* Problem: Vague in places.  
    * What kinds of resources?  Coal?  Natural gas?
    * Connected to who/what?  Grads?  Current students?  Staff?  Bob's?
    * What is "give back"?
* Not in the correct form.  "I can" -> "I want to be able to"

Revisions

* As a recent alum, I want to be able to identify departments that I can
  coordinate with so that I can volunteer/help.
    * I want there to be a button that says "Help Grinnell" that, when I
      click it, provides a list of volunteer opportunities that meet my
      interests.
    * As someone who wants to help Grinnell, I want to be able to specify 
      my interests so that I am only offered opportunities that correspond
      to them.
* As a recent alum, I want to be able to know about events on campus
  related to my major and clubs so that I can keep track of what is
  happening in major/clubs.

### Set one

As an administrator, so I can raise money for the college, I want to be able to ask Alumni for donations

As a student, so I can get a job, I want to talk to alumni working in top companies

As an alumni, so I can find old friends, I want to be able to search for people on the website

Commentary

* Follows our book's form.  (That's an awkward form.)
* Vague
* "I want to be able to search for people based on ..."
     * class year
     * their nickname
     * major
     * location
     * combinations

Revision

As an administrator, so I can raise money for the college, I want to be able 
to select sets of alumni according to some criteria and have custom 
fundraising messages sent to them via email.

### Set two

As any user on News & Awards landing page,
I would like to see some article stubs with links to recent Grinnell news
In order to expedite finding of recent articles I want to read and make the landing page less sparse and somewhat pointless

As any user on Events landing page,
I would like to replace (cont), meaning continuous, with All day on these types of events
In order to remove user confusion with "continued", a more (subjectively) more common use of the abbreviation

As any user on Events landing page,
I would like to see just a calendar with "__ Events Available" for each day that has events, and be able to click on a day to see via pop up what those events are
In order to make the calendar less ugly, as well as crowded, with varying row heights and 5-line event titles

* Problem: Broad definition of "user".
* Problem: A few typos.
* Problem: Very specific critiques of current design, rather than
  real aspirational goals.

### Set three

When creating an account on grinnellconnect.com as a student, it sends you to a link which tells you it's necessary to create an account on grinnellconnect.com. This seems fairly useless unless you start on the page that the link directs you to.

Using the alumni calendar on grinnell.alumni.edu to see events to attend will tell you the cost and the possibility of reduced prices, but doe not make it clear how to receive reduced prices if you meet the criteria.

Donating to Grinnell through the alumni page states that donators have the right to know that their donations are actually going toward the specific purpose that they state, but it is not clear how donators will be able to receive this information.

* Not phrased as desires/goals.
* Rephrase of first one: As a student, I want to be able to create an account
  on grinnellconnect.com so that I can get help from alumni.
* Rephrase continued: As the system administrator, I want to send 
  verification emails to new accounts to make sure
  that accounts are only created by the people with the associated
  email address.  
* Rephrased continued: As a student, I want to be able to click a link
  in the verification email and go to ???? so that I can start taking
  advantage of GrinnelLConnect.

### Set four

I am a Grinnell Alum and I am using Grinnell Connect to get in touch
with other Grinnellians. I had two different names during my time at
Grinnell. A is my official name and B is my preferred name. There are
people who know my by A and some other people know me as B. However,
when I try to register an account for grinnellconnect.com, I don’t
find a place for me to fill in my preferred name.

I am Grinnell Student and I want to find a summer internship. I know
some Grinnell Alums work for big tech companies and I want to find who
they are and how to contact them through alumni.grinnell.edu.

I am Grinnell Student and I already registered for alumni.grinnell.edu
and grinnellconnect.com. Now I am graduating from Grinnell and I hope
both websites could auto-update my account to an alum account.

* Condense the first one.
* Perhaps more details on the last one.
* As a Grinnell alum, I want to be able to fill in both real and
  nickname so that I can present a more accurate representation of
  who I am.
* As a current Grinnell student, I want to be able to find contact info
  for alums who work at big tech companies, so that I can communicate with them.
* As a current Grinnell student, I want to be able to be able to find a
  list of companies that alums work for, so that I can
  find contact info for alums who work at big tech companies.
* As a current Grinnell student, I want to be able to be able to search
  alums by industry, so that I can find contact info for alums who work
  at big tech companies.

### Set five

As a future Grinnell alum, I had decided to check out the web sites where I would, one day, visit frequently. Upon visiting the site http://alumni.grinnell.edu/, I noticed that there were lots of very interesting links. The site was very user friendly, and I enjoyed navigating it. I did have a few concerns, however. When clicking on most of the links, the site would go to the original, non-alumni Grinnell site. I think it would be really neat to see how the departments have changed over the years. All in all, I really liked this site. 

As a web administrator for alumni.grinnell.edu, I must admit that we had to cut a few corners on the web site. However, what's most important in this web site is that it provides different information about Grinnell alumni reunions. We also showcase our new students and future alumns. 

I enjoy web sites, especially well-developed ones, and therefore, I found this web site to be very informative. I appreciated the various ways someone could sign up for grinnellconnect.com. Although not as much fun as plans, I found this to be a decent web site and service. 

* Long - hard to pull out core ideas.
* Narrative is nice, but not for programmers.

### Set six

As a student user of grinnellconnect.com, I want to be able to view sample professional postings so that I know if I want to go through the extensive sign-up process. 

As an alumni.grinnell.edu administrator, I want to be able to track users who donate multiple times so that I can show content relative to their donation areas and recognize their continued interest in the college. 

As a faculty user of alumni.grinnell.edu, I want to be able to suggest content for the website so that users can see what my department is doing. 

### Set seven

I graduated from Grinnell about 3 months ago, and I'm a little
nervous about where I'm going to go from here.  I'm took a small job
close to home but it's not something I'd want to do in the long term.
I was able to go onto alumni.grinnell.edu and they have this page called
"New Grad Resources" which was so helpful!  There were lots of resources
available for resume help and some older alums with more connections to
help me get started.  Overall, it was a very helpful resource since I
was working with next to nothing before.

For me, computers and technology are not my forte.  Most of my life I've
been getting by doing most of my interactions face to face.  But with the
way the world has been changing over the years, I have found that online
interactions are a very useful way to stay in touch with colleagues
and friends.  Using https://grinnell.connect.com, I've been able to
not only stay in touch with all of the people I went to college with,
and even talk to some recent graduates who need some assistance!

So as a senior, I'm obviously concerned about my future.  The resources on
the alumni and Grinnell connect websites have been extremely helpful
for me.  I've been able to update my LinkedIn and build a real,
respectable resume with help from the websites and the CLS.

### Set eight

As a student, I would like to be able to distinguish between my concentrations and my major/majors, in order to be more specific about what my qualifications are.

As an alumni, I would like to be able to instant message another user, in order to contact old friends through a professional medium.

As a student, I would like to be able to access the sight [sic] without waiting for the training because I may have trouble finding time to complete formal training.

### Set nine

As an alumni, I want to submit my financial information securely, so that I can make a small one-time donation to Financial Aid.

As an alumni, I want to view the date of the next reunion(s), so that I can make plans to attend.

As an administrator, I want to be able to make the banner picture smaller by at least half, so that the page looks less gimmicky.

Some Ruby-isms, Rails-isms, and More
-------------------------------------

_Left over from last class._

### Ruby != Rails

In answering questions, some of you seemed to conflate Ruby and Rails.
Ruby is a general-purpose programming language.  Rails is a Web
application development infrastructure that happens to use Ruby for its
programming aspects.  (At least one of you also asked about HTML.)

### Syntax

The most difficult aspect of Ruby was digesting the syntax. 

### Refactoring

One of the aspects that I find the most confusing about Ruby is the
aspect that I also find fascinating. The ability to refactor code and
make it much more concise. I understand that most of the code in Ruby
can be made more concise than in other languages, but I do not know how
to do so as I am very new to the language and do not know many of the
ways to refactor. I would like to learn more about how I can rewrite
code so that it is still easily understandable, but much more concise.

### Migration

What is it exactly?  Why is it useful?

### Hard to parse

The calling of functions using left shift bitwise operators confused me
because I’m surprised why you just can’t call using function names
and just append the strings together using the ‘+’ operator.

### Metaprogramming

I don’t really understand how you can generate code at runtime yet
you write the code before you run the program. Is there a way to go to a
program that is already running and change the code and then the program
changes the way it executes.

The concept of metaprogramming is sort of difficult to understand. What
are some more examples of metaprogramming?

### Duck Typing

What is it?  How does it relate to key oop principles?

### `yield`

I am still working to understand what “yield” does. According to the
reading, yield is commonly used with iterators. Once in the scope of the
iterator, code is executed until it reaches yield.  Then, any arguments
given to yield are then used as arguments in the block of the iterator. I
still do not understand why this is more or less useful to program with.

### Scaffolding

Scaffolding continues to confuse me, though I'm slightly less confused
as to why it's a good teaching tool.

### Mix-Ins

I think I understand in a broad sense how mix-ins work, but I’m fuzzy
on how they work syntactically in code. I’m not sure I would recognize
them if I was looking at a program that used them. I understand that
modules are included using the keyword include, but I’m not sure where
mix-ins are included in Ruby code. I’m also not sure how yield works,
even though it seems pretty intuitive, I’m just not sure if I would
be sure when to use it.

