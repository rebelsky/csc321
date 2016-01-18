CSC321.01 2015F, Class 13: Design Patterns for SaaS
===================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Design patterns.
* The GoF list of patterns.
* SOLID.
* More code smells.

Preliminaries
-------------

### Admin

* Welcome back.  I hope you had a great Thanksgiving break.
* Welcome to our penultimate week of class!
* Are any students looking for project work over break and planning to be
  in town over break? 
* News.
* Testing: &amp;, &eacute; &ccedil;

### Assignments

* Read/view Chapter 12, Practical DevOps.  No journal necessary.
* No more programming assignments!

### Questions

Design patterns
---------------

* A design pattern is a blueprint for how to solve certain kinds of
  problems.
* Inspired by a book in the architecture by Christopher Alexander called
  _A Pattern Language_.
* A group of leading object-oriented designers decided to create a set
  of patterns for object-orented design.  Wrote a book: _Design Patterns_.
* For better or for worse, patterns have infiltrated computing.  There are
  even "teaching patterns".
* Positives
    * For novice programmers, suggests (a) the problems you are encountering
      are not new, so there is knowledge you can build upon; (b) here's
      the core knowledge you need.
    * For experienced programmers, provide a langauge to talk about solutions.
* Negatives
    * Can be misused - misunderstanding the relationship of the problem
      at hand to the problem the pattern seems to solve.
    * Can limit the "creativity" of the profession.
    * ...

Patterns
--------

Be ready to give

* An overview of the pattern (one or two sentence description)?
* How do you achieve it in Java or Ruby?
* A situation in which it is useful.
* Anything else you think may be helpful.

### Creational

#### Factory Method - ZC

* Create an object without specifying what the object is.
* Example
        interface FruitTree
        {
          Fruit makeFruit();
        } // interface FruitTree
* We can make lots and lots of fruit by calling the makeFruit method.
* Can spawn creatures in a game.  
        interface Creature
        {
        } // ...
        class Alien implements Creature
        {
         ...
        }
        class Centipede implements Creature
        {
          ...
        }
        interface CreateFactory
        {
          public Creature makeCreature();
        }

        class Game
        {
          CreatureFactory factory;

          public Game(CreatureFactory cf)
          {
            this factory = cf;
          }

          public void play()
          {
            everyTenSeconds
              factory.makeCreature();
          }
        } // class Game

        new Game(new CreatureFactory() { 
          Creature makeCreature()
          {
            return new Centipede();
          }
        }

        new Game(new CreatureFactory() { 
          Creature makeCreature()
          {
            return new Alien();
          }
        }

#### Abstract Factory - AOA

* Lets you build a factory for factories.
* Example
        interface GUIFactory
        {
          Button createButton(String buttonName);
        } // interface GUIFactory

        class WindowFactory implements GUIFactory
        {
          Button createButton(String buttonName)
          {
            return new windowButton(String buttonName);
          } // createButton
        }

        class iFactory implements GUIFactory
        {
          Button createButton(string buttonName)
          {
            app.setCustomLayout(...)
            app.getLayout.addButton()
            return app.getLayout.getLatestButton();
        } // class iFactory

#### Singleton - RJ

* A class that has only one instance.
* You have a global access point to that one instance.
* Useful for one thing that you have to coordinate across the system.
* Example: You may only have one printer, or one access point to a
  printer.  (Although we often have multiple printers.)
* Example: "The Application".
* Generally: Some overriding thing (like the application) or some
  shared value (like the HDD).
* Implementation: Use a private constructor with a class method for
  extracting the value.

        public class Singleton
        {
          public static Singleton theOneAndOnly;

          public static Singleton get()
          {
            if (theOneAndOnly == null)
              theOneAndOnly = new Singleton();
            return theOneAndOnly;
          }

          private Singleton()
          {
            ...;
          }
        } // class Singleton

#### Prototype - BC

* A memory efficient way of coming up with new classes.  Clone the
  class and then extend it in some way.
* Why do this instead of just creating objects in the class?
* Specify methods on the fly, rather than in fixed code.
* Java example
        public class Wall
        {
          String getContents()
          {
            return "Brick";
          }
        }

        wall1 = new Wall() {
          String getContents()
          {
            if (random() < 0.5)
              return "You see a smokey mist";
            else
              return "You see misty smoke";
          }
        }

        wall2 = new Wall();

* Key idea: Once you've made an object (or a copy of an object), you can
  change its methods (or values).
* Alternate version (probably closer to the original).

        public class Wall
        {
          public Wall(String type, int length, int width, int height
                      int x, int y, int z, int loadbearingcapability,
                      ...)
          {
            ...
          }
        } // class Wall

        wall1 = new Wall("stone", 10, 10, 5, 100, 200, 300, 50);
        wall2 = new Wall("brick", 10, 10, 5, 110, 200, 300, 50);
        wall3 = new Wall("stone", 10, 10, 6, 100, 210, 300, 50);

        // Another approach
        wall1 = new Wall("stone", 10, 10, 5, 100, 200, 300, 50);
        wall2 = wall1.clone();
        wall2.setType("brick");
        wall2.setX(wall2.x() + 10);
        wall3 = wall1.clone();
        wall3.setX(wall3.x() - 10);

        // That is, we started with one generic wall and then
        // customized the parts we needed to customize for each
        // subsequent wall.

#### Builder - AD

### Structural

#### Adapter, Bridge - AM

* An adapter allows two classes to communicate, even though they have
  different interfaces.
* Bridges are similar; you write them while building your code, while
  adapters are designed for legacy code.

        public interface Comparator
        {
          /**
           * Return a negative number if x comes before y
           * Returns 0 if x equals y
           * Returns a positive number if x is greater than y
           */
          public int compare(Object x, Object y);
        } // interface Comparator

        public class LessThan
        {
          public boolean compare(Number x, Number y)
          {
            return x < y;
          }
        } // class LessThan

        public static void sort(Integer[] vals, Comparator compare)
        ...

        // We need to change the interface of LessThan to match the
        // interface of comparator.
        // That's a task for an adapter.
        public class AdaptedLessThan
          implements Comparator
        {
          this.lt = new LessThan();
          public int compare(Object x, Object y)
          {
            if (this.lt.compare(x, y))
              return -1;
            else if this.lt.compare(y,x)
              return 1;
            else
              return 0;
          }
        }

        public interface Lightning
        {
        } 

        public interface TradiPhone
        {
        }

        public class UpdateiPhone
          implements Lightning
        {
          TradiPhone thingToBeAdapted;
          ...
        }

* Sam refers to this as "Wrapping" a class.
* Good programmers write generic adapters that turn one interface
  into another.

#### Proxy, Fa&ccedil;ade - ZW

* Proxy: Make some things available to client, sometimes caching.
* Sam's normal model: Connecting to Web services

#### Decorator - SZ

#### Composite - DK

#### Flyweight - NS

### Behavioral

#### Template Method, Strategy - EE

* Template Method: Redefine the steps of an algorithm without changing the
  algorithm.
        public abstract class SelectionSorter
        {
          public int compare(Object val1, Object val2); // abstract
          public void sort(Object[] values)
          {
            ...
            if (compare(val1,val2) < 0)
              ...
          }
        }

        public class IncreasingSorter
          extends SelectionSorter
        {
          public int compare(Object val1, Object val2)
          {
            return val1 < val2;
          }
        } // extends SelectionSorter
        
        public class DecreasingSorter
          extends SelectionSorter
        {
          public int compare(Object val1, Object val2)
          {
            return val1 > val2;
          }
        } // extends SelectionSorter
        
* Strategy: Redefine implementation of the same algorithm

        public interface Sorter
        {
          public void sort(Object[] values);
        }

        public class QuickSorter
        {
          public void sort(Object[] values)
          {
            int pos = partition(values);
            sort(...);
            sort(...);
          } // sort
        }

        public class MergeSorter
        {
        }

#### Observer - EB

#### Iterator - LG

#### Visitor - DC

#### State - RNG

#### Chain of Responsibility - MO

#### Mediator - AHD

#### Interpreter - HD

#### Command - TD

SOLID Principles
----------------

* ...

More code smells
----------------

