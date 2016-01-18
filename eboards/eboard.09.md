CSC321.01 2015F, Class 09: Pause for Breah 
===========================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Code smells.
* Designing databases.
* Big picture: Rails apps.
* Medium picture: Restful programming.
* TDD and BDD, revisited.

Preliminaries
-------------

### Admin

* You might enjoy reading this article: 
  <http://www.pgbovine.net/command-line-bullshittery.htm>.
* The second half of our EdX course is at
  <https://edge.edx.org/courses/course-v1:GrinnellCollege+CS321-1-F15b+2015_Fall/about>
    * All dates and most assignments still have to be updated.
* For next week:
    * Reading: Chapter 5.
    * Programming: <https://github.com/saasbook/hw-oracle-of-bacon>
    * Partners tonight.
* There were a lot of problems on today's assignment, so we may spend some 
  time going through it today.

### Questions

* Harry Baker for Mayor?

Code smells
-----------

What is a code smell?

* Does the code "look nice" or "look not so nice"
* In 151, Sam sees a lot of

        (map vshift-drawing (iota 100) (make-list 100 drawing-unit-circle))
        (map (r-s vshift-drawing drawing-unit-circle) (iota 100))

* One theory: You learn good and bad parts of code through experience.
* Another theory: Once we have a list of bad smells, we can train novices
  to find problems in code.
* What are signals to you that there might be problems in code?

Signals of potential problems

* Bad formatting.
    * Sometimes a sign that people don't care.
    * Hard to read, which means that we may not be keeping track of
      what's going on well.
    * Likely to have mismatched braces/parens/etc.
* Long parameter lists.  
    * Easy to get things mixed up or to drop a parameter.
    * In a procedure call, it's hard to tell what each thing means.
    * Sign that the procedure is trying to do too much.
    * What would you do with 
      `(image-copy-paste! image source-left source-top source-width source-height target-left target-top target-width target-height)`?
        * `(image-copy-paste! image region-1 region-2)`
        * `(image-copy-paste! kitten (region 0 0 400 300) (region 20 30 40 50))`
        * Two functions: `image-copy` and `image-paste-scaled!`
* Bad variable names.
    * Meaningless - noah-1, my-function, your-function
    * Meaningless, but themed - java, c, scheme, python, ruby
    * Short, and with no associated semantics - a, b, c, d, e, f, p, q, r, s
    * Unrelated variables with similar names
    * Overly abbreviated: fsck
    * In some cases, variable names that include their type
    * Very long variable names: the_number_of_people_in_this_class_on_tuesday_of_last_week_before_the_fire_alarm_rang
    * Long variable names that differ in only one letter: the_number_of_people_who_like_pizza vs the_number_of_people_whom_like_pizza.  number-closest vs numbers-closest.  run-test vs run-tests.
    * Misleading variable names.  E.g., `(let ([boolean-1 (* n 1/2)])`
* Hardcoded values 365, 10, ...
    * Makes it hard to change the program (e.g., if an array size changes)
    * Makes it hard to change the program in other ways, too.
    * Some of these values change from community to community (e.g., in order
      for a program to be sold in Indiana, pi must be 3).
    * Sometimes the same number appears with different meanings; likely
      to have difficulty changing.  (Particularly for people who like
      global search and replace.)
    * What is obvious to one person may not be obvious to another.
* Code with lots of comments
    * Code should be clear.  Comments indicate that the code is not clear.
      Not clear code is more likely to be erroneous.
    * Good comments express goal; code expresses how
    * A few comments that explain needfully tricky code.
    * Views of clear code differ.  To many C programmers, this is
      very clear.
<pre>
        char *strcpy(char *source, char *target)
        {
          while (*target++ = *source++)
            ;
          return --target;
        }
</pre>
* Procedures that try to do too much.
    * Makes code harder to understand.
    * Sometimes a suggestion that you didn't decompose well.
    * Sometimes a suggestion that the code grew a bit too organically.
    * Likely to get unwieldy.
* Infinite while loops (e.g., while (1) ...) - confusing control flow.
    * Hard to analyze.
    * But there are some programs that should effectively run forever:
      Clock, Operating System, Web server, Autotest, ...
    * Many can be rewritten as `while (everything_is_hunky_dory)`
* Repeated code.
    * Probably unnecessary, taking up space
    * For the future: We'll probably fail to make all the changes.  In
      fact, we may have already updated only one part and not the other.
    * Redundancy is usuaally evidence that you haven't thought carefully
      about the code.
    * Code should be DRY!
* Long procedures.
    * Hard to trace.
    * Usually evidence that the person didn't think about decomposition.
* Lots of if statements for special cases
    * Haven't thought generally about the problem.
* SOFA, not Sophie
    * Short
    * One purpose
    * Few parameters
    * appropriately Abstract

Yes, you should think about these as general guidelines.  There's some 
really good code out there that fails many of the "obvious" smells.

Make it a habit to look through code you write or receive and ask whether
it violates some of these smells.  If it does, rewrite it.

Designing databases
-------------------

We are working with relational databases in Rails, and will do so elsewhere.
What is a relational database?

* Relational databases are sets of tables (groups of labeled columns of
  data; each row represents one item).
* For a movie database, what tables would you have?
* Movie
    * Title: String
    * Rating: String (or member of the ratings list)
    * Director: String
    * Release Date: Date
    * Summary: Text (Really big string)
    * Rotten Spuds Average Rating: Number
* Date
    * Year
    * Month
    * Day
    * Calendar
* Where are the relations?
    * The tables (or combinations of tables) represent the relations
* What kinds of relations do we have?
    * 1-1  (there is exactly one robot for each computer in 3813)
      (there is only one summary for each movie, and only one movie for
      each summary)
    * 1-many (each director may direct multiple movies, but each 
      movie has only director)
    * many-many relationships (each actor may appear in multiple movies,
      each movie may have multiple actors)

How do we represent each kind of relation in these tables?

* 1-many typical table, with some thought.  The many are usually
  the keys, the one is the other column (e.g., director is the one,
  title is the many)
    * Database optimization: Add another table, director
         * id: integer
         * name: string
    * Movie database
         * name: string
         * director_id: integer
* 1-1 is also sometimes given as a separate table

Many-many is complicated.  How would we deal with multiple actors per
movie

* One Approach: Lots of rows in the same table
    * Title: String
    * Rating: String (or member of the ratings list)
    * Director: String
    * Release Date: Date
    * Summary: Text (Really big string)
    * Rotten Spuds Average Rating: Number
    * Actor: String

        Star Wars PG "George Lucas" ... Mark Hammill
        Star Wars PG "George Lucas" ... Harrison Ford
        Star Wars PG "George Lucas" ... Carrie Fisher
* Fails DRYness
* Have a "list of actor ids" as a row.  Hard to process.
* Add a second table
* Role
     * Movie: MovieID
     * Actor: ActorID
     * Character: String

<pre>
Movie
        1, "Star Wars", "PG", "George Lucas", "Before you were born", "A long time ago in a galaxy far far away", -3

Actor
        1, "Mark Hammill"
        2, "Harrison Ford",
        4, "Carrie Fisher"

Role
        1, 1, "Luke"
        1, 2, "Hans Olo"
        1, 4, "Princess Leah"
</pre>

* Many-to-many relationships generally require an extra table
* It turns out that this helps solve a lot of unexpected problems
* Good relational databases hide much of the complexity of searching and
  joining these tables.

But now our information is in multiple tables, what do we do?

* Most relational databases let us create temporary pseudo-tables by
  "joining" other tables together - lets you treat it as a single
  table.

Medium picture: Programming with Web Services
---------------------------------------------

* A modern application gathers data from lots of places.

TDD and BDD, revisited
----------------------

