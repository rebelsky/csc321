CSC321.01 2015F, Class 03: The Ruby Language
============================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Regular Expressions.
* Ruby vs. Java.
* Important aspects of Ruby.
* Puzzling aspects of Ruby.
* Discuss HW1.
* Start Chapter 4 (with partner).

Preliminaries
-------------

### Admin

* My "sanity plans" are failing in two ways: I'm not limiting my work as
  much as I should be and I'm also not getting everything updated as
  much as it should.  Expect to see the due dates get fixed on the
  Edge site in a day or so.

### Upcoming Work

* Read/view chapter 2 and answer question/journal
* Read/view chapter 4 with partner and *start* HW2 on Rails
* HW2 will be due in two weeks

### Questions

_Why can't we submit the quizzes?_

> I don't know.  I'll work on it in my two hours.

Regular Expressions
-------------------

* Included in most modern programming languages.
* But not particularly new.  
* Can think about interesting theory or practically - "I want something
  that looks like *this*."
* Text processing problems
     * Find the text that matches a particular pattern
     * Replace text that matches a particular pattern
     * Remove text that matches a particular pattern
* What kinds of things do we want to represent?
     * Exact text
     * Concatentation just means match this then that then that
       `ab`
     * "Anything" (usually as part of something more complicated)
       "I want words that start with "A", have two additional letters,
       and end with "thing".  In most regular expression languages,
       that's a period.  /A..thing/
     * One of a limited set of characters (e.g., only vowels).
       [aeiou]
         * Inverse set notation [^aeiou] - everything besides aeiou
         * Range notation [a-z] - lowercase letters
         * Range notation, continued [a-zA-Z] - American letters
         * Named sets [[:alpha:]]
     * Concatentation just means match this then that then that
       `[aeiou]b`
     * Start of string (^) and end of string ($)
     * Repetition of a pattern (e.g., "as many l's as there are"),
       The Kleene * suffix a pattern with * means "0 or more copies"
         * `+` means 1 or more copies
         * `{n,m}` between and m copies - I think
    * Language problem: How do we represent "I want to match an asterisk
      (or a period) (or a left bracket) or ...".  If we think like C
      programmers, we use a backslash.  `\*`
    * If we want to use repetition with more than a single character
      "As many copies of ab as there are" Not `ab*`.  Use parentheses!
    * If we want to make choices of bigger things than single characters,
      use `|`.
* How do you get good at using these things?  Practice (plus trying to
  read)!
    * Designed for writabillity more than readability.
    * Pair them with appropriate string operations in the language of
      your choice.

Ruby vs. Java
-------------

* Ruby and Java have very different programming models.
* In some way, the differences are underlying differences in philosoply
  similar to those between agile and plan and document.
* Similarities
     * Both use dot notation - But dots in Java can mean a field or a
       method, whereas dots in Ruby always seem to mean a method
     * Both allow metaprogramming
* Differences
    * In Java, everything must be typed; in Ruby, types are, well, variable
    * Type systems let you avoid errors, or at least catch them early.
    * Ruby is so opposed to Scheme notation that you can avoid parentheses
      that you would normally juse in Java.
    * Different mechanism of protecting fields
    * Ruby seems to include lots of strangely useful features.
    * Ruby trusts programmers enough that they can extend/change core
      types.
    * In general, Java does not trust programmers and Ruby does.
    * Ruby feels friendly, Java feels bureaucratic
* Ruby provides way too many ways to approach any particular problem.

Puzzling aspects of Ruby
------------------------

* `yield` and passing blocks vs. procs
* metaprogramming
    * General concept(s)
    * `class_eval`
    * `attr_setter`
    * `attr_getter`
    * `mixins`
* "duck typing"
* "Red-Green-Refactor"
* Why symbols?

Ones we are dismissing quickly

* Why is `each` not a loop?
    * It's not an *explicit* loop

### Yield

* Normal paradigm: Your function takes arguments and applies things
  to the arguments.
* The yield model: You take a block of code and can apply that block
  of code at any point
* Why do yield rather than just pass a block or function as a parameter?
    * Can be an issue of more efficient coding
    * Different ways of thinking about the world
* What's the difference between yield and return
    * Yield takes you back to a different piece of code
    * Return returns to your caller
    * Yield gives you more subtle control

### Metaprogramming

* Write programs that modify programs
* Modify (write), analyze (read)
    * Read: Input; Classes and Functions in the program, ...
    * Write: Change behavior of operating code - change methods, add
      methods, ...  Person.addMethod wakeup! lambda(whatever)  ...
* How do we do this?
    * In Ruby, there are lots of approaches
    * We can modify a particular object 
    * We can modify a particular class
    * We can modify the Class class
    * We can modify the Object class
* This relies on Ruby's method call mechanism and representation of
  objects and classes - All runtime, involves checking a series of
  potential handlers for a message/call.
    * Contrast with Java, which determines this at compile time
* Why would you want to do this?
    * We've written an accounting program that handles US dollars
      We realize that we have to handle Euros, too
    * Patch a running Web server
* Good example from the homework - Concision
  `attr_accessor :foo` is easier than
        def foo
          @foo
        end
        def foo=(bar)
          @foo = bar
        end
* In CSC 151, `(section - <> 2)` or `(r-s - 2)`

### `attr_writer` and `attr_reader`

* How would you write a procedure `attr_setter sym` that generates and
  adds a method of the form 
        def sym=(var)
          @sym = var
        end
* With `class_eval`!

### What is `class_eval` and what does it do?

* "Evaluates code"
* We can write a string that looks like code and treat it like code
Discuss HW1
-----------

Start Chapter 4 (with partner)
------------------------------

