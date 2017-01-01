CSC321.01 2016F, Class 20: Design Patterns for SaaS
===================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Design patterns.
* Reading reflections.
* The GoF list of patterns.

Preliminaries
-------------

### Admin

* Thanks ZS and SC!

### Upcoming Work

* No reading for Wednesday!  (No reading for Friday, either.)
* Reading Journal for Wednesday (due Tuesday at 11pm) 
    * Subject: Reading Journal for Class 21 (Your Name)
    * If you could share two ideas or concepts from this class about
      software design with your successors in future offerings, what 
      would they be?
    * What is your prospective topic for the ethics essay?  Why?

### Good Things to Do

* Get enough rest.

### Questions

Design patterns
---------------

* Much of modern software design is intricately tied to object-oriented
  programming.
* Realization: Just as there are common algorithmic problems and algorithms
  that can be used to solve those, there are also common architectural
  design problems in large programs, and "expert" programmers often have
  better solutions than novices.  We should share those.
* Christopher Alexander: Patterns of ... (Architecture)
* "We" stole that idea.
* GoF: Design Patterns
* And growth: CS Education Patterns (eh), Language Design patterns, etc.
* Reactions are mixed.
    * Some programmers use patterns blindly
    * Some worry: Eliminate need for programmers to be creative or thoughtful
    * Sam believes: Patterns have two important strengths:
        * Reading about patterns helps you think differently about program
          design.
        * Patterns give us a terminology to talk about design.
* Vocabulary and set of concepts all software designers should know.

Reading reflections
-------------------

### Most Useful

* Singleton [x3]
* Dependency Injection Principle [x2]
* Single Responsibility [x2]
* Liskov substitution
* Demeter principle
* Composite
* Open/Closed

### Most Relevant

* Single responsibility [x2]
* Observer [x2]
* Bridge
* Dependency injection
* Facade
* Iterator
* Liskov substitution
* Open/Closed 
* Factory

### Most Confusing

* Adapter
* Chain of responsibility
* Concurrency (straight forward, but complicated to use)
* Dependency Injection
* Factory
* Flyweight (would like to see an example)
* Iterator
* Liskov Substitution
* Open/Closed (easy in theory, complicated in practice; how do
  you change behavior without affecting other code?) [x2]

Exploring Confusing Patterns and Principles
-------------------------------------------

For each ...

* What is the basic idea?
* What's an example in which this is a useful pattern or principle?

### Iterator

* Separates the traversal from the organization.
* Use: Delete all of the elements of a structure that meet some 
  criterion.
* Note: It keeps track of where you are.
* `struct.each do |x| ... end`, whether we have a graph or a list or
  a tree or an array or ....
* Note: We can also ask structures for an iterator object, which we can
  then process using things like `get`, `next`, and `hasNext`.
* Why might we want iterator objects, rather than just the `each` method?
    * You might want to iterate the structure multiple times in
      parallel.

### Factory

* You have a group of related objects, such circles, triangles, and
  squares.  You create a superclass or interface called "shape".  
* Question: How is this different than interfaces or inheritance plus
  polymorphism?
* The factory is an object that produces multiple things
    * Objects
    * Classes
* Let's think about a video game.
    * We have lots of things that are ships.
    * Every random(10) seconds, we create a new ship.  How?
               Ship s;
               if (random(100) == 0)
                 s = new DeathStar();
               else
                 s = new TieFighter();
    * Level two: We want BirdOfPrey and EnterpriseClass
    * One way to deal with this issue:
                public interface ShipFactory
                {
                  public Ship build();
                } // interface ShipFactory
                public class StarWarsFactory implements ShipFactory
                {
                  public Ship build()
                  {
                    return new DeathStar();
                  }
                }
                public class StarTrekFactory implements ShipFactory
                {
                  public Ship build()
                  {
                    return new BirdOfPrey();
                  }
                }
                class Level 
                {
                  ShipFactory myFactory;
                }
* It turns out this can be really useful for games, UIs, and more.

### Adapter

* Helps you deal with interfaces that may not be compatible.
* Amiko provides a method, `sendMail` and a bunch of other methods.
* MyApp expects an object of class `Mailer` that provides a method
  called `send`.
* How do we join them together?
* Bad idea: Change the code of MyApp.
* Good idea: Write `public class AmikoAdapter implements Mailer`
     * The `send` method just calls `sendMail` method of `Amiko`.
* ArrayList might be thought of as one kind of adapter.  Take arrays
  and make them follow the list interface.
* Sometimes it's to hide functionality; more often, it's just to go
  from one thing to something similar.

        public interface LinearStructure<T>
        {
          public void put(T val);
          public T get();
        }
        public interface Stack<T>
        {
          public void push(T val);
          public T pop();
        }
        public interface Queue<T>
        {
          public void enqueue(T val);
          public T dequeue(T val);
        }
        public class StackAdapter<T> implements LinearStructure<T> 
        {
          Stack<T> s;
          public void put(T val) 
          {
            s.push(val);
          }
          public T get()
          {
            return s.pop();
          }
        }

### Liskov Substitution

* If you have a method implemented for a class, that method should work
  for any subclass.
    * Polymorphism says that we can use a member of a subclass whenever
      we use a member of the class.  That means that we should be able
      to use any method.
* Fundamental to understanding/use of polymorphism.
* Requires more careful thought about what methods should be where.
    * If you think about vehicles only as mechanical items, you might
      include a `turnOff` method.  If your realize that horses are also
      vehicles, you'll realize that you may want to move `turnOff`
      into a `MechanicalVehicle` subclass of `Vehicle`.

### Flyweight

* A mechanism for reducing the memory footprint of a program.
* If you're going to use one value multiple times, we shouldn't make
  copies of that value.
* Example: You want the same circle again and again and again.
* Example: If there's only supposed to be on DeathStar, we should return
  a reference to that in `ShipFactory.build`.
* Example: A document is a series of letters.  For each letter, you need
  a bit representation.  All the copies of each letter should refer to 
  the same bit representation.  The letter is the flyweight way to
  refer to the bit representation.
* String constants in Java are also a kind of flyweight.

### Chain of Responsibility

### Dependency Injection

### Open/Closed

### Concurrency

The GoF list of patterns
------------------------

