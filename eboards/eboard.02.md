CSC321.01 2016S, Class 02: Deploying Rails Applications
=======================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* A quick overview of Ruby.
* Setting up your first Rails app.

Preliminaries
-------------

### Admin

* I'm still working on getting the other Web sites for the class set up.  
  I'll let you know as soon as I do.
* Our book says to use Bitbucket, but I'm comfortable using Github, and
  you'll find that the instructions work more or less the same. You can
  use whichever you'd like.
* Handout: Academic honesty policy.
    * Read.
    * Sign if possible.
    * Discuss if not.
* Albert apologizes for lying to some of you.

### Upcoming Work

* For Friday: Finish Chapter 1 of Hartl (including all construction).
* 8pm Thursday: Reading Journal on Hartl, Chapter 1
    * Message subject: CSC 321 Journal Day 3 (Your Name)
    * What, in your own words, is the MVC framework?  Why do programmers
      use such a framework?
    * Which task was the most difficult for you to complete?  What instructions
      would have helped you get through that task faster?
    * If you wanted `https://yoursite.c9users.io/goodbye` to show the
      text "Thanks for Visiting", what steps would you do?
    * What is something you found particularly confusing or puzzling in
      the reading?

### Good Things to Do

#### Academic

* Convo Thursday!, 11 am in JRC 101.  
* CS Extras Thursday!  Summer research opportunities at Grinnell.

#### Peer

* Track meet on February 6, Field House.

### Questions

A quick overview of Ruby
------------------------

* Modern programming language.
* "One" designer.
* Imperative, functional, and OOP characteristics.
* Good at "Get the job done quickly."

Cool things about Ruby

* Too many ways to express the same concept.

        if TEST consequent
        consequent if TEST
        if TEST
          consequent
        end
        unless not TEST
          consquent
        end
        consequent unless not TEST

* Everything (more or less) is an object
* Yay!  There are anonymous functions (with multiple syntaxes and subtle
  differences, because it's Ruby)
* Conditional assignment
* It's expressive, and can likely match your model of expressiveness.

Setting Up Your First Rails App
-------------------------------

* We'll spend the majority of class time working on working on chapter 1 
  of Hartl.
* As a good CS student, you should go beyond the particular instructions
  at times and try variants.  How do names come into play?
* Warning!  Way too much of modern software design is "convention"

The following instruction takes way too long

    $ rails _4.2.2_ new hello_app
         .
         .
         .
         run  bundle install

I think you can safely hit ^C once it hits the bundling.  Then edit your
Gemfile (as instructed in the book), and then type `bundle install` on
the command line.  (When you do that, it will still take a long time,
but a bit less.  Read ahead in the book while it is installing.)
