CSC321.01 2016F, Class 19: UML
==============================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Basics of the UML.
* UML: Class notation.
* UML: Other issues.

Preliminaries
-------------

### Admin

* Friday PSA!
* Warning: Although I teach the UML, I don't use it all that much.
  (I also don't work in medium or large software teams.)
* Note: When Dr. Davis designed this class, she did not include a significant
  component on the UML.  However, one of the class mentors noted that he had
  found serious value in using the UML, and advicated for its inclusion.  I
  look forward to hearing what you think about this unit.

### Upcoming Work

* Reading for Monday: SaaS 11
* Reading Journal for Monday (due Sunday at 11pm) (as always, inspired by JLND)
    * Subject: Reading Journal for Class 20 (Your Name)
    * In your own words, what is a design pattern? What is an antipattern?
    * What new design principle or pattern did you find most useful?
    * Which design principle or pattern did you find the most relevant to your CSC 322 project or other prior experience with object-oriented programming? Explain the pattern and why you chose it.
    * Which design principle or pattern did you find the most confusing? Explain it as best you can and say where you got confused.

### Good Things to Do

* Fall Fest.
* Book sale!

Basics of the UML
-----------------

* Unified Modeling Language
* We often find that we understand computational concepts when
  we draw them.
* What pictures do you normally draw?
    * Linked lists
    * Run time stack / aka call stack
    * Heap
    * Queues
    * Pointers, which help us understand what's going on when we're
      using them.
    * Trees and graphs
    * Invariants in array algorithms
    * Recursion trees
    * ...
* Two decades ago, there was a huge growth in OOA&D.
* Ten groups of programmers would likely develop twelve different notations
    * Most missed important issues
* Let's pick a relatively standard notation so that we can communicate
  more clearly.  Hence, the UML.  UML1.4, UML2.0, ...
* We will use this language in a variety of ways.
    * As a tool for talking about design while designing.
    * As a check while developing.
    * Communicate with others about the structure of your program.
* Multiple kinds of diagrams
    * Relationships between objects (e.g., inheritance, inclusion)
    * Control flow / Action
    * Program state
    * ...

UML: Class notation
-------------------

Want to represent the various kinds of relationships objects have.

* Subclassing: One object can be a subclass of one or more other classes.
  (Also with interfaces.)  "is-a" relationships.
* Association: One object can include another object (have a field that
  mentions the other object).  "has-a" relationships.
    * General
    * Containment/composition
    * Strict containment.
* Mixins.
* "Object pool": Objects can send requests into a common pool, and other
  objects can read from that pool.
* See board and InterWeb for more info.

UML: Process Notation
---------------------

* See board and InterWeb for more info.
