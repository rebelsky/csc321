CSC321.01 2016F, Class 21: Good Design, Revisited
=================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Remaining Patterns and Principles.
* Important outcomes - SamR's view.
* Important outcomes - Student views.

Preliminaries
-------------

### Admin

* Friday is the last day of class.  We'll do EOCEs and continue
  debriefing on learning outcomes from the course.
* I should respond to your suggested topics over the next few days.
* Last chance for lunch orders for tomorrow.

### Upcoming Work

* None for Friday (other than showing up).
* Essay (writing prompt is in "Ethics, Revisited").

### Good Things to Do

* Get enough rest.

### Questions

Remaining Patterns and Principles
---------------------------------

### Chain of Responsibility

* Core idea: If a request is made, it passes through the appropriate
  chain of responsibility until an object handles it.
* The object-oriented version of case statements.
* Example from Wikipedia: Large expensive item gets passed from 
  department to department until we find someone to handle it.
* Example: Who answers this question?
* Q: Is it vertical or horizontal?  More horizontal.
* Q: Does only one object handle the request, or can multiple objects?
  Generally, we expect only one object to handle the request.  That's
  the "chain".
     
### Dependency Injection

* Core idea: If you have two or more classes that have similar functions,
  you make a new class that has similar functions and make everything
  else depend on that.
    * Book: Classes that depend on each other, but may change.  So
      create a class that doesn't change that both depend on.
* Example: Two different kinds of email services.  Instead of an if
  statement, you just have a common interface.
* What does "dependency" mean?
    * One class relies upon another class to achieve some function.
      (E.g., send email)
* What does "injection" mean?
    * Inject the class that provides the function.
* These are closely related to plug-ins.
* You can inject upon construction
* You can have an inject method. (Sam prefers.)
* You can use chain of responsibility

### Open/Closed Principle

* Open to extension
* Closed to modification
* Example: Player class
    * We can extend Player to Bard, Dragon, or ...
    * But you can't change the Player.

	        public class Player
	        {
	          String name;
	          int hp;
	          Object[] bag;
	          int numPossessions;
	          
	          void takeDamage(int amt)
	          {
	            ...
	          } // takeDamage
	          void pickUp(Object thing) 
	          {
	            bag[numPossessions++] = thing;
	          } // pickUp(Object)
	        } // class Player
	
	        public class Dragon extends Player
	        {
	          int pilesOfGold;
	
	          void breatheFire(Player target)
	          {
	            // target.takeDamage(5000 + random(pilesOfGold)*50);
	            target.hp -= (BASE_FIRE_DAMAGE + random(pilesOfGold)*GOLD_FIRE_MODIFIER);
	          }
	
                  @Override
	          void takeDamage(int amt)
	          {
	            super.takeDamage(amt/10);
	          }
	
                  @Override
	          void pickup(Object thing)
	          {
	            throw new StupidActionException("Dragons cannot pick up things.");
	          } // pickup(Object)
	        } // class Dragon

* Problems with modified `breatheFire` - Why is it bad to access
  `target.hp` but okay to call `target.takeDamage`.
    * Smells bad.
    * HP might become negative.  (Or did that happen already?)
    * Seems unfair.
    * Can break the program logic.  For example, dragons are supposed
      to take 1/10 the damage of normal players.  Accessing the
      base fields breaks that idea.
    * What happens if `Player` changes?  We hope that a change to Player
      that does not affect the behavior of Player should not affect
      Dragon.
* How do we ensure Open/Closed (in Java)?
    * Four P's of protection: `public`, `private`, `protected`, 
      no modifier (package)
    * `public`: Any other object can access this.
    * `private`: Only objects in this class can access this.
    * `protected`: Only (a) objects in this class and subclasses and
      (b) objects in the same package.
    * none: Only objects in the same package.
* For strict Open/Closed, use `private` for all fields, and `public` for
  methods as appropriate.

### Concurrency

Important Points: Sam's View
----------------------------

### Big-Picture Issues

### Particular Details

Important Points: Student Views
-------------------------------

* Relational database management systems.
* Behavior driven design (and TDD) 
    * Forming tests based on what the client wants and developing your 
      program to suit their minimum needs first makes sure that you and 
      the client are on the same page as much as possible.
    * I hadn't thought of TDD as a design method before and it helped 
      me write code in smaller chunks to get one function working at a 
      time instead of getting bogged down in big-picture hypotheticals. 
    * Automated testing is both important, and convenient for anyone who 
      might be using your code in the future. Understanding how to write 
      good tests is essential to being a good developer. 
    * Even if you don't implement TDD, make sure you know how to test 
      your code and plan your code around behaviors it should exhibit.
* Code smells
    * These are some very simple identifiers that will help your code be 
      more correct and look more elegant at the same time.
    * Refactor!
    * Keep your code DRY.
* Pay attention to the ethics of Computer Science. 
    * I didn’t realize there were a set of “rules” until this class. 
      Even if you choose to abide by them or not, be aware of what people 
      will expect of you.
* Agile programming
    * especially iteration goals, point systems, pair programming, 
      quick daily check-ins, and the idea of developing in small chunks
      (user stories) so that you always have a working, adaptable
      code base
* Design Patterns
    * Even though it is important to learn how to solve problems on your 
      own, because many problems you will face in your career have been
      solved by previous programmers, it is not only okay to look at
      their solutions, but it is actually good practice to learn from
      them and use them in your own code as long as you cite where you
      got your material.
    * Model-View Controller
* User Stories
    * Effective to handle client expectations
* Software Life Cycle
* Legacy Code
    * I think most of us will end up working with legacy code at some 
      point and knowing a good procedure for wading through it and
      figuring it out will be very helpful. I would have liked to get some
      more practice doing so in a more guided and structured environment,
      or watching someone experienced figure out legacy code.
* Ethics
    * I think we just need to be hit over the head with ethics sometimes. 
      Perhaps multiple times. If there have been ethics portions of the
      required courses before, either I wasn't mature enough as a person
      or as a computer scientist to appreciate them. Now seemed like an
      effective time to me to introduce them.
* Ruby
    * Ruby's meta-programming abilities are super interesting. 
      Understanding how to use these may make programming in Ruby easier. 
* General design points
    * One of the most useful things in writing a program is organization. 
      Like writing an essay, it is much easier to write a program if 
      you start with a strong outline.
    * Software development isn't as simple as just writing code and
      testing it.  Depending on who you are developing for and your
      objectives, designing the code may be more complicated than just
      laying out a couple quick sketches.
    * When I was younger, I thought the key to being a good programmer 
      was simply being able to learn new languages and systems quickly.
      However as I get older, I'm starting to realise that simply being
      able to learn what's there isn't as important as being able to
      evaluate the tools and overall concepts at hand, and then applying
      them to the problem. This is related to the pattern and antipattern
      concepts discussed recently.
    * Write code conscientiously! If you're writing code in industry,
      it would be potentially / definitely used by people/updated. Write
      clean, DRY, efficient code that can be updated and make sure it's
      readable and understandable. Cannot stress the importance of this
      enough. Don't make your code legacy code.
    * Make your code neat and comment everything, not just for others,
      but for yourself. Legacy coding is important, don’t be a pain to 
      your successor or future you.
    * Usually if you are having a problem with figuring out how to approach 
      a problem, someone else has had a similar problem and another
      person has most likely come up with a common solution that can
      help you solve the issue.
    * One important aspect of working in a group, especially with coding,
      is that although you should split up the tasks so that each member is
      not working on the same code at the same time, it is also important
      to constantly be checking in with other members to ensure that you
      know what they have changed, why they have changed it, and to confirm
      that they have not made any errors with their fixes.
