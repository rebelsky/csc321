CSC321.01 2015F, Class 06: Behavior-Driven Development
======================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* BDD Basics.
* Cucumber Basics.
* Some Examples.
* Homework time.

Preliminaries
-------------

### Admin

* We are continuing to hit transition problems.  I'll do my best to
  help you work through them.
* Mr. Stone will be teaching next week's class.

### Homework

* No matter what it says online, your homework is at
  <https://github.com/saasbook/hw-bdd-cucumber>.  (Agh!  I gave you the
  wrong one for this week.  Fortunately, none of you started.)
* You will also be doing some readings on computer ethics for next
  class.  Expect an email about that tonight (although I think I've 
  gotten it into the site for now).

### Questions

* The only programming homework is hw-bdd-cucumber
* The only reading is the ethics readings
* Yes, you still have to journal.

Behavior-Driven Development
---------------------------

* What do you see as the key features of BDD?
* What are the relationships you see between BDD and TDD?  Similarities
  and differences?
* Some folks have suggested that we replace TDD with BDD.  Does that
  seem like a good idea?  Why or why not?

Key Features of BDD

* A programmatic mechanism for checking whether programs do what people 
  want them to do.
* We think about what the program does in terms of overall behavior.
  ("Big picture")
* Typically written in a style that is understandable to non-technical
  people.  Potentially easier to understand.
* At least in cucumber, we think about things hierarchically
    * We break overall utility into features
    * We break features into scenarios
    * We break scenarios into steps or declarations
* In most BDD systems, we focus on user stories

Similarities between BDD and TDD

* Both automated ways to check "if things are working right"
* Both expect you to express criteria for your tests
* Both expect you to write criteria *in advance* of writing code
* Both are video games.  Turn everything green!

Differences between BDD and TDD

* Difference audience: TDD tests don't have to be written for non-technical
  people.
* BDD is often big picture, TDD is often smaller pieces.
* BDD is a bit easier to tell when you're done.  "Look, the user is happy!"
* TDD encourages us to focus more on edge cases, whereas BDD is more about
  general cases (although it does include some edge-like cases)
* BDD and TDD give different kinds of confirmation

Should we replace TDD with BDD? (or vice versa)

        As a programmer
        I want the sqrt function to behave appropriately
        so that I can write valid code

        For example,

          When I give 4 an input to sqrt
          Then I expect to get 2 as an output
          When I give -4 as an input to sqrt
          Then I expect to get 0+2i as an output
          Wehn I give "frog" as an input to sqrt
          Then I expect to get an error message

        check_equal(2, sqrt(4));
        check_equal(imaginary(0,2), sqrt(-4));

Arguments for:

* You can show your client (or your manager) something that he/she/ze
  can understand.
* Learning one system well is easier than learning two systems well.

Arguments against:

* We're programmers, we don't need such verbose "code"
    * BDD seems to have much more running time overhead
* Different intent, so use different systems; use things how they are
  designed.  "If all you have is BDD, everything is a behavior."
    * TDD system features are likely to be different than BDD features; 
      use the things that have the right features.
* Don't abuse tools  (don't hack things to make them work for something else)
    * BDD shouldn't be technical testing
* Separate domains!  
    * Two ways to think about the example above: Programmer and Client

Cucumber
--------

* As we think about behaviors, will we need to work on the model, the
  view, or the controller?
* What changes are we likely to have to make?
* What step definitions will we have to write to get the text to 
  call Ruby/Rails code?

<pre>
Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter
</pre>

<pre>
Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
</pre>

* Model, View, and/or Controller?
    * Model
    * View (implicit)
* What changes to M, V, C?
    * Model: Add a new field, Director using the wonders of Migration
    * View (implicit): You need to be able to see the new field in the
      listing of movies.
* Step definition?
    movies.each do |movie| addMovie movie.title, movie.rating, ... end

<pre>
Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"
</pre>

* Model, View, or Controller (plus changes)
    * View: The edit page needs a text field named "Director".
    * View: The "Update Movie Info" button might need to be changed.
      (maybe not, depending on how we phrase the query it makes)
    * Controller: The update method may need to be changed to
      include the director.
    * Model: We changed it above.  
* Step definition?
    * /^I go to the edit page for "([^"]*)"$/, should be built into
      Capabyra.  
    * /^I fill in "([^"]*)" with "([^"]*)"$/, shuld be built into
      Capabyra.
    * /^I press "([^"]*)"$/, should be built into Capabyra
    * Then the director of "Alien" should be "Ridley Scott"
        * Simple database query

<pre>
Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
</pre>

Work Time
---------
