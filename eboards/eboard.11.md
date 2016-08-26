CSC321.01 2016S, Class 11: Behavior-Driven Development
======================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Modeling Lessons.
* BDD Basics.
* Cucumber Basics.
* A Cucumber Example.
* Cucumber in Practice.

Preliminaries
-------------

### Admin

### Upcoming Work

* SaaSBook 8 for Friday.
* Reading Journal for Friday (due Thursday at 8pm)
    * Subject: Reading Journal for Class 12 (Your Name)
    * How does Fox and Patterson's presentation of test-driven development 
      compare to your prior experiences with unit testing?
    * Choose the most confusing idea from 8.2 - 8.6. Make a serious attempt 
      to explain this idea in your own words. What questions remain?
    * Choose the most confusing idea from 8.7 - 8.9. Make a serious attempt 
      to explain this idea in your own words. What questions remain?
    * What do you see as the relationship(s) between BDD and TDD?  Which
      do you prefer?
    * What do you see as the most important or enduring concept in this 
      chapter overall?
    * Citation: Questions are based on journal questions from JLND.

### Good Things to Do

#### Academic

* Misc. department stuff
* Thursday convo: Hilary Mason '00
* Thursday extra: Hilary Mason '00

#### Peer

### Questions

_Why does Dr. Racket make some words green and some words black?_

> Words in the dictionary are green.  Other words are black.

Lessons from Modeling Exercise
------------------------------

What do you take as the key lessons from the modeling exercise?

* As you add more attributes, you often find that you want to add
  more tables.
* Try to be DRY.  Put the value in the database once, use ids,
  and let the DBMS handle the relationships.
     * Movie: ID, Title, Ave Rating
     * Reviewer: ID, Name
     * Review: ReviewerID, MovieID, Rating, Text
     * What do we do if we know that the movies might be searched
       regularly by MovieID 
         * Sort them by MovieID
     * What if we're also searching them by ReviewerID?
     * Overall solution: Build another table.
     * Fortunately, DBMS's do that for us.
     * DBMS = Database Management Systems
* Because we try not to duplicate data, we can create organizations
  that seem inefficient.
* We need to consider the relationships between tables, A and B
    * 1:1 for each element in A there is exactly one corresponding
      element in B
    * 1:many for each element in A there may be 0 or more corresponding
      elements in B
    * many:many for each element in A there may be 0 or more corresponding
      elements in B, and vice versa.
* How do we handle each of these if we are doing things in SQL (rather
  than in Rails, which tries to hide some of the obvious things)
    * 1:1, same table
    * 1:many, two tables, in table B, you have a pointer (id) to 
      the corresponding value in table 1.
    * many:many, make a separate table that pairs ids from A with
      ids from B.
* Don't forget that fields usually need types!

Cucumber Basics
---------------

* A toolkit to facilitate behavior driven design

The stack

    Features
    Scenarios
    Steps

    Step Definitions - regular expressions that turn "natural" 
      language into calls to functions

        /I go to the page for user number ([0-9]+)/
          gotopage "/users/\1"
    Support Code
      Where we write things like gotopage
    Automation Library
      Things your support code relies on
      Capybara

When you write Cucumber, you need to write the "human stuff"
(features, scenarios, steps), all reside in the feature file;
and the programmer stuff (step definitions, support code)

Makes sense for code reuse
Makes it harder to do updates
And working in what feels like three different languages is not
  always all that fun

A Cucumber Example
------------------

Let's walk through some scenarios and think about what work we might have
to do to implement these Cucumber scenarios.  Do they effect model, view,
or controller (or all three)?  (Suppose we had the repaired version of
the original database, with no director.)

<pre>
Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

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

vs.

    movies reset
    movies add new Movie("Star Wars", "PG", "George Lucas", ...);

IY says that the poorly named FactoryGirl Gem helps do this kind of code.
Cucumber in Practice
--------------------

