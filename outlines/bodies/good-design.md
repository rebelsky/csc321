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
* Some patterns will feel obvious to you.
    * Some have always been part of functional languages
    * Some are now incorporated into language design

Some Questions
--------------

GoF Patterns
------------

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

SOLID Principles
----------------

Intended as a mechanism for thinking about class design.  Five basic
principles.

* Single Responsibility - Do one thing well.
* Open/Closed - Open for extension, closed against modification.
* Liskov Substitution Principle - T's subclasses follow the interface
* Interface Segregation
* Dependency Inversion 
