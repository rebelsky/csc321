Refactoring, Revisited
----------------------

* As we noted, we use refactoring to improve code, particularly code that
  smells bad.  We'll consider a few of the bad smells you identified and
  consider how to approach them.
* Nearly identical code (within a procedure): 
* Nearly identical code (similar procedures):
* Too many parameters:
* Magic numbers: 
* Complex conditionals:
* Code that is never executed: 
* Too-long methods: 

Design Patterns
---------------

* Inspired by C. Alexander's work on Architecture, *A Pattern Language*.
* Leading OO-programmers/designers looked at common software architecture
  tasks/problems and came up with a taxonomy of common solutions to those
  problems.
* Valuable in (at least) two ways
    * For novice programmers, provides better approaches to
      tasks that they don't realize are old.
    * For experienced programmers, provides a language to talk about
      approaches.
* There are growing movements to write "patterns" (and "anti-patterns")
  for many different classes of problems.  There are even teaching
  patterns.
* Most folks at Grinnell believe that you apply patterns loosely; they are
  intended as a way to help you think, rather than strict strategies.

Patterns
--------

### Creational

* Abstact Factory
* Factory Method
* Singleton
* Prototype
* Builder

### Structural

* Adapter
* Proxy
* Facade
* Bridge
* Decorator
* Composite
* Flyweight

### Behavioral

* Template Method
* Strategy
* Observer
* Iterator
* Visitor
* State
* Chain of Responsibility
* Mediator
* Interpreter
* Command

More Smells
-----------

* ...
