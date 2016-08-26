CSC321.01 2016S, Class 04: A Static Site
========================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Reflections on chapters 1-2, continued.
* Testing.
* Starting our primary application.

Preliminaries
-------------

### Admin

* Happy Monday!  (If such a thing is possible.)
* Don't forget to caucus tonight (or to observe if you can't caucus).
* Please sign up for the EdX class at
  <https://edge.edx.org/courses/course-v1:GrinnellCollege+CS321-1-S16a+2016_Spring/about>
* For those who haven't dealt with me before ...
    * If you are sending email to ask questions or get help, rather than to
      submit work, please use HELP or QUESTION in the subject.  (Yes, it's
      okay to use all caps in such email.)
    * I generally respond to email promptly.  If I haven't resopnded within
      a day, your email is lost in my inbox.  Send it to me again.

### Upcoming Work

* Tuesday at 8pm: Reading Journal (on SaaSbook)
    * Message subject: CSC 321 Journal for Day 5 (Your Name)
    * Please match the subject.
    * Summarize in a sentence: How is the agile approach different from the plan-and-document approach?
    * What surprised you the most in the SaaSbook material? Why?
    * What are you most excited to learn more about later in the semester? Why?
    * What point confused you the most? Try to explain it in your own words.
    * Citation: Sam stole these questions from Janet.
* Before writing reading journal.
    * SaaSbook: Chapter 1 and sections 10.1-10.2, 7.1, 7.3-7.4 
    * Watch at least one SaaSbook video (only the video, no distractors,
      notebook and writing utensil in hand)
* For Friday: Finish the chapter 3 project.

### Good Things to Do

#### Academic

* CS Table Tuesday.  (Facebook)
* CS Extras Thursday.  (LaTeX)

#### Peer

* Track meet on February 6.

#### Other

* Democratic caucuses at Harris (on campus) or elsewhere
* Republican caucuses at the high school

### Questions

Reflections on chapters 1-2, continued
--------------------------------------

_How persistent are the data in our toy application?_

> There's a database.  The data are supposed to persist.

_Please explain the data path in the MVC._

> See the whiteboard.

_What is RESTful programming?_

> An architecture for designing programs, often used on the World Wide Web,
  based on someone's Y2K dissertation.

> Something of a standard, at least as much as there are standards on the 
  Web.

> For the Web, requests are specified by URL plus action (GET, PUT, DELETE)

> Client, rather than server, maintains state.  (Server may use the state
  variable that it passes back to the client.)

_What is database migration?_

> A mechanism for updating databases.

> E.g., add a new model; change the relationship between different models
  (e.g., make it clear that we have a one-to-many relationship); delete a
  model; add a field; delete a field etc.

> If someone is running an older version of your database, this gives them
  the information to bring it up to date.

_What is the purpose of `rake`?_

> It's a Ruby version of `make`.

> `make` is a program that keeps track of the steps necessary to build
  programs and the dependencies between the parts of a program.  E.g.
  foo.c depends on foo.h.  foo.o is built from foo.c (using the instructions
  cc -c -o -lm foo.c).  rake does something similar: Using rules, it figures
  out what steps need to be done.

> Tradition on *nix systems is that there are make targets to build 
  an application (`make`), to test it (`make test`), to install it
  (`make install`), to clean up cruft (`make clean`), etc.  "Cruft" is
  things like .o files that you probably don't need once you have the
  application up and running.

_Why do we type `bundle exec rake ...` rather than just `rake ...`?_

> `bundle` uses the version of `rake` associated with the current project,
  rather than the default version on your system.

Testing
-------

Take two minutes and chat with your peers: Why do we write (automated) tests?

* Keep track of corner cases (and think about corner cases).
* Help us find possible errors, incuding future errors.
* When you change your application later, they let you make sure that you
  haven't accidentally broken anything.
* Automated tests make it easier for us to check all of the above.
* Automated tests make programmers more efficient, since we don't have
  to look at the output, except when things break.
* Allows communication between developers: "I expect that this code will do
  this in this situation."
* Policy; many companies (e.g., Amazoogle or Goozon) now expect that all 
  code has accompanying tests.

More reasons

* Tests document expectations!
* Tests, when written before code, help eliminate biases.
* Tests free you to refactor!

Good programmers write tests before code (and after) and run them 
regularly.

Starting our primary application
--------------------------------

Work on chapter 3 of Hartl!

