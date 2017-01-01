CSC321.01 2016F, Class 02: Getting Started with Ruby
====================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Ruby
* Some Ruby Problems

Preliminaries
-------------

### Admin

Notes

* Cloud 9 now requires a credit card.  Let me know if that causes difficulty.
  (Maybe not if you sign up through Github.)
* How long did the Ruby thing take?
    * Mostly in the 4-5 hour range, so I've used a whole lot of your
      homework time for week one.
* Apologies: Summer student papers.

Homework

* More Ruby (forthcoming)
* Reading journal (forthcoming)

Good Things To Do

* Alcohol town halls tomorrow (11 am and 7pm)
* CS table tomorrow
* CS extras Thursday
* Convo a week from Thursday
* Concert committee Tuesday at 8 in JRC 209
* Mock Trial tonight at 7pm
* Asian-American Association 7-8 Wednesday in AAA suite

Note

* 20% student discount at the bar at Prairie Canary, Sunday through
  Thursday.  (My, that fits well with tomorrow's town hall.)

### Questions

Ruby
----

What's something familiar?

* Conditionals
* Method stringing e.g.,
    str.upper.substring(1,5).append("ing")
* Objects!
* Interactive environment.
* Syntax was close enough to most imperative languages that it's
  understandable.

What's something new and exciting you've discovered about Ruby?

* Not too many parentheses
* Cool iterators
* Symbols (they exist in Scheme, so they aren't so new, but ...)
  quick comparison is awesome.
* Introspection
* Metaprogramming: Attribute writers and readers
* Messaging
* Implicit instance variables
    * Good: Easy for the programmer
    * Bad: Harder to catch typos, such as 1st vs lst.
* Patterns / Regular expressions

How does Ruby handle a programmer's need for multiple inheritance?

* Multiple inheritance: When one class can inherit from multiple parents.
* Why would you want it?
    * Polymorphism: The same class may be usable in multiple situations
      (e.g., a Llama is both an animal and a means of transport)
      (e.g., an NT is a baseball player, a computer scientist, and a
       physicist - baseball players can hit, computer scientists can
       code, and physicists can predict the location of baseballs when hit)
* How do we deal with multiple inheritance in Java?
    * Java does not allow multiple inheritance
    * However, Java does support implementing multiple interfaces, which
      means that you can use an object in multiple situations

        public interface BaseballPlayer
        {
          public void hit(Baseball ball);
        } // interface BaseballPlayer

        public interface ComputerScientist
        {
          public void code(Specification problem);
        }

        public interface Physicist
        {
        }

        public class NT implements BaseballPlayer, ComputerScientist, Physicist
        {
          public void hit(Baseball ball)
          {
            System.out.println("Home run!");
          } // hit

          public void code(Specification problem)
          {
            System.out.println("int main(return 0);");
          } // code
        }

        ...

        solveAllTheWorldsProblems(ComputerScientist cs)
        {
          for (problem : Problems)
          {
            compile(cs.code(problem)).execute();
          }
        }

        adam = new NT();
        solveAllTheWorldsProblems(adam);

    * Java does not allow multiple inheritance because it leads to
      some significant semantic problems.  For example, what happens
      if two parents have the same method?
    * Ruby does not allow multiple inheritance.  However, it allows
      mixins.  Ruby trusts that the programmer controls things well.

What is something particularly confusing or puzzling in the Codecademy
tutorial?

Other comments ...

* Ruby looks awesome.  I'm looking forward to using it.
* Ruby looks troublesome, and like it has the Perl problem: There are 
  twenty very different ways to solve any problem.

Some Ruby Problems
------------------

Write `sums_to_n?(vals,val)` that returns true if any two distinct
values from `vals` (a list of values) sums to `val`.

* `sums_to_n?([1,2,7],5)` -> false
* `sums_to_n?([1,2,7],3)` -> true
* `sums_to_n?([1,2,7],8)` -> true
* `sums_to_n?([1,2,7],9)` -> true
* Two nested .each loops

        vals.each {|x| vals.each {|y| if (x+y) == val return true;}}
        return false;

* Doesn't work for `distinct`
* n^2
* If we want it more efficient, we might sort first
* We might also consider some of the additional Ruby operations available
  to us.  (This is not a solution, but reveals a psosible approach.)
  `[4,1,2].sort.combination(2).each{|x,y| print x,y}`

Write `multiple_of_4?(bitstring)` that takes a string of 0's and 1's
(representing an unsigned integer) as input and returns true if the
string represents an integer divisible by four.

Write `starts_with_consonant?(str)` that determines if a string
starts with a consonant.
