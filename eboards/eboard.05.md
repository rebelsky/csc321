CSC321.01 2016F, Class 05: A Static Site
========================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Reflections on chapters 1-3.
* Testing.
* Starting our primary application.

Preliminaries
-------------

### Admin

* We now have a class mentor.  Welcome to Sooji Son, who will be with us
  on Mondays and Fridays, and will also set up an evening hour.
* I think I now have all of the EdX stuff up.  (Fingers crossed.)
* I apologize to those of you who, like me, are red-green color deficient.
* How far did you get on chapter 3?
* How are we doing on homework time?
* How many of you used JUnit?

### Upcoming Work

* Finish the Rails Tutorial Chapter 3 work.
* SaaSbook: Chapter 1 and sections 10.1-10.2, 7.1, 7.3-7.4
    * Chapter 1 and those sections of Chapter 10 are in week 1
    * Chapter 7 is in week 4
* Watch at least one SaaSbook video (only the video, no distractors, notebook and writing utensil in hand)
* 10pm Tuesday: Reading Journal (on SaaSbook)
    * Message subject: CSC 321 Journal for Day 6 (Your Name)
    * Summarize in a sentence: How is the agile approach different from the plan-and-document approach?
    * What surprised you the most in the SaaSbook material? Why?
    * What are you most excited to learn more about later in the semester? Why?
    * What point confused you the most? Try to explain it in your own words.

### Good Things to Do

* CS Table Tuesday: Passwords and more.  (Handouts on Charlie's door.)
* Convo, September 8 (Thursday, 11:00 a.m., JRC 101): Roberto
  Gonzales on "From Undocumented to DACAmented: Understanding Legal Status 
  in a New Policy Context".  
    * Get a free copy of his book _Lives in Limbo: Undocumented and Coming 
      of Age in America_ by visiting Macy 203 during regular office times.
* Learning from Alumni Thursday: The Job Board Doctor
* CS Extras Thursday: PM on PL
* AppDev Recruiting Event, Thursday, 5:30 p.m. (after extra).
* SHACS is offering Question, Persuade, & Refer (QPR) training for
  students, faculty, and staff – this is suicide prevention training
  run by a national institute. They’re first holding one session with
  a cap of 30 people for September 13th in ARH 120 from 11 – 12 noon.
  Email Toby if you're interested.

### Questions

Reflections on chapters 1-3
---------------------------

What have you learned so far about Rails and about Rails development?

* Write down three important things that you'd tell to someone
  new to Rails development (or at least newer than you).
* Share with neighbors.
* Share with class.

Answers

* There's this magic wand called "scaffolding" that sets everything up
  for you, but it's a PITN because you have no idea yet what has been
  set up.
     * You still have to do additional work.  It's not a magic 
       be-all do-all.
     * Over the long term, you'll find that scaffolding can make you
       more efficient, but it requires that you understand what the
       scaffold makes.
* MVC frameworks.  Model/View/Controller.  Explains workflow of how
  data flows through the program.
     * Model: Underlying representation of the data.  (Model files;
       database.)
     * View: What the user sees.  For static pages, there's a file
       for each, written in erb, which is an extended version of HTML.
       (We can also describe views in other ways.  For example, the
       controller can specify a view, rather than relying on a file.)
     * Controller: Talks to the model and view and pulls everything
       together.  Most of the application logic.  Methods of what
       you can do/have access to.  Inherits from the ApplicationController
       class.
* Growth mindset: It may seem like there are fifteen different languages
  and tools to learn, but you can do it!
* Ruby: You can come at problems from different angles.
* Organize and refactor your code.
* Rails development requires a whole ecosystem of tools and services
    * Rails
    * Rails gems
    * Version control (with GitHub and Bitbucket)
    * HTML and a bit of HTTP
    * Ruby
    * erb
    * Difference between development and deployment
    * How to deploy
    * Installing software
    * New vocabulary (and some weird customs on how vocabulary is used)
    * "Custom over configuration!"
    * Cloud 9
    * Running servers on virtual machines
* Complicated file trees ("custom")

Testing
-------

What is testing?  (If you've read chapter 3, how does the testing in chapter
3 relate to the other testing you've done?)

* Trying lots of "cases" with the code you've written.  If all of the
  cases check out, you're good to go.  Ideally, these tests are run
  automatically, rather than manually.  
* Requires that you think carefully about inputs and outputs, at least
  when you're dealing with traditional functions.
* Manual testing can be time consuming.  
    * Have to run code.  
    * Have to watch the results to make sure that they are correct.  
    * Have to remember/think about what tests to do.
    * Humans aren't good at reading results, and may even type inputs
      differently.
* Manual testing is usually less exhaustive.
    * Since it's time consuming to manually test, we may do fewer tests.
    * If we write them down and can run them automatically, we're likely
      to write more tests.
    * You can write loops for automated testing.
* Good tests reveal problems, often at the place it happens, rather
  than elsewhere.
* Good tests let you update your code and quickly make sure that everything
  continues to work fine.  (That is, that you didn't break anything.)
* Real programmers write tests.
* Debate: Test-Driven Development
    * Write tests and run the program.
    * Expect it to fail.
    * Fix it for that test.
    * And then go back and do it again.
* Alternate: Develop multiple tests.  Then write code.  Then refine.
* Testing is a natural part of the Ruby/Rails universe.

What kind of tests would you write for a Web app?

* All the pages that are supposed to load, load.
* All the controls on every page work in the way that they are
  supposed to.  (Hard for highly-interactive pages.)
* System can handle the load.
* Errors when the user does something wrong.
* Access is appropriately limited.
* Data manipulation: When the user does this, the database now contains
  (or does not contain) this.

Starting our primary application
--------------------------------

Work on chapter 3.
