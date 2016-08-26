CSC321.01 2016S, Class 09: Software as a Service
================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Learning from Video.
* DRY.
* Data Modeling.
* Thinking about SaaS.
* Rails, revisited.

Preliminaries
-------------

### Admin

* 13 hours with alums was a bit overwhelming yesterday and I'm a bit behind.
* Friday PSA.

### Upcoming Work

* SaaSBook 7 for Monday.
    * Yes, I will ask you about your experience watching videos.
* Reading Journal for Monday (due Sunday at 8pm)
    * Subject: Reading Journal for Class 10 (Your Name)
    * What is the most important thing you learned about cucumber as a tool for behavior-driven development?
    * What is the biggest difference betwen the agile approach to requirements and the plan-and-document approach to requirements?
    * Which of the BDD pitfalls do you think you or your team will have to be most careful about? Why?
    * Do you have any questions you need to resolve before you use cucumber and BDD? If so, what are they?
    * Citation: Questions are based on journal excellent questions from JLND,
      made less so by SamR.
* Description of BadSpuds for Monday (due Sunday at 8pm)
    * Subject: "Design of Bad Spuds (Your Name or Names)"
    * Suppose you are building a movie review database.  What tables
      will you need, what fields do you have in each table, and what
      are the relationships between the tables?

### Good Things to Do

#### Academic

* Thursday convo: Hilary Mason '00
* Thursday extra: Hilary Mason '00

#### Peer

* Track Saturday!  NBB runs at 11am.

#### Miscellaneous

* Vote in new VPSA elections.
* High School Large Group Speech Presentations Saturday at 6:30 p.m.
  at the high-school auditorium.  Sam will reimburse you for the $5 entry
  fee (or give it to you in advance).

### Questions

Learning from Video
-------------------

Advantages of Video as compared to Book

* The book is very dense.
* The videos are more engaging (or at least less boring).
* Faster, particularly if you learn how to use the speed controls.
* It's even more passive than reading!

Disadvantages of Video as compared to Book

* When you are watching at 4x speed it's really hard to take notes,
  whereas books stop naturally when you turn away from them to take
  notes.
* Crappy captions are completing confusing and detrimentally distracting.
  (Don't worry.  The justice department is on it.  Armando will probably
  be in jail soon.)

Similarities

* Notes?  What notes?

DRY
---

* Don't Repeat Yourself.  (Damn, if I hadn't fast-forwarded through that
  point I would have remembered it.
    * Don't Repeat Yourself.  (Damn, if I hadn't fast-forwarded through that
      point I would have remembered it.))
* What does it mean to you with regards to coding?
    * Literally!
        * `square(2)` ... `square(2)`
    * Don't do the same sequence of method calls.
        * `System.out.print (nbb.name + "'s favorite candy is ");`
        * `System.out.println (faves.lookup(nbb,"candy"));`
        * `System.out.print (pw.name + "'s favorite candy is ");`
        * `System.out.println (faves.lookup(pw,"candy"));`
    * Alternate
        * `void candy(Person p) { System.out.print (p.name) ... }`
    * Often good to generalize your code.
    * Also fix with things like inheritance.
    * Also fix with sensible loops.
        * Instead of `candy(nbb); candy(pw); candy(atm); ...`
        * Use `[nbb,pw,atm].each(candy)`
* What aspects of Rails and Ruby help with DRYness?
    * The ability to include template code in Web pages.
    * Mixins in Ruby
    * The better version of CSS
    * Metaprogramming
    * Higher-order programming with things like yield
    * Partials - generalized code
    * Inheritance
    * Everything is an object (as relates to inheritance)
        * Maybe Duck typing
    * Scaffolding
    * Gems
    * Normal programming language features: Loops, subroutines (functions)
* How do you DRY out your code?
    * Use the above.
    * If you program by copy-paste-change, DRY out your code.
    * In practice, the first time you copy-paste-change is probably okay,
      if you're just getting something working quickly; but make a note
      to fix it.

Data Modeling
-------------

Typically using a relational model.    The term relation is used int
two ways:

* A "relation" is what we might think of as a table.  If we are describing
  courses at Grinnell, we might have a Student relation.
    * surname, forename, stuid, classid, semester, grade
* There are relationships between relations
    * Every student has at least three classes.  Every class has at
      least one student.  Each student has exactly one student id.
* What kinds of relationships are there between relations?
    * one-to-one: Each student has exactly one student ID
    * one-to-many: each professor has multiple classes, but each class
      has only one prof.
    * many-to-many: student-class relationships
* Problem: How do we represent these relationships (in a database)?
    * Fortunately, if you describe them correctly in your Ruby data
      model, you don't have to worry about it.
    * Unfortunately, Sam thinks you should need to worry about it anyway.
* One-to-one: Usually put in the same table.
* One-to-many: Associate an identifier with each thing, and use
  that identifier in the other table
    * Faculty table: facid, faclastname, facfirstname, facage,  
      facsalary, ...
    * Course table: courseid, coursename, ..., facid
* Many-to-many
    * Option one: Use the same idea as above.
        * Student table: stuid, stulname, firststuname, ..., courseid
            * 33123, "Smith", "Jordan", 123
            * 33123, "Smith", "Jordan", 431
        * Course table: courseid, coursename, ..., facid
            * 123, "Underwater Basket Weaving"
            * 421, "Lifesaving"
    * Better option: Add another table of stuid x courseid
        * Student: 33123, "Smith", "Jordan"
        * Course: 123, "Underwater Basket Weaving"
        * Enrollment: 33123,123
* Our database manager helps us with all of this.

BadSpuds - Movie Rating System

* What tables?
* What relations between those tables?



Thinking about SaaS
-------------------

Rails, revisited
----------------

