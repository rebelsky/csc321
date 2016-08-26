Lessons from Modeling Exercise
------------------------------

What do you take as the key lessons from the modeling exercise?

* Think about the types of your data.
* IDs are useful.
* Symmetric one-many relationships are a many-many relationship.
* We often represent many-many relationships with a table.
* If we write about the relationships, a smart program can figure
  out how to represent it in a table.
* We need to cross our fingers that the DBMS does things sensibly.
    * Example, cross references.

Behavior-Driven Development
---------------------------

* What do you see as the key features of BDD?
* What differences do you see between BDD and TDD?
* What are some potential disadvatnages of BDD?

Cucumber Basics
---------------

* A programmatic approach to Behavior-Driven Design
* Often viewed in terms of a "testing stack"

        Features
        Scenarios
        Steps

        Step Definitions
        Support Code
        Automation Library

* *Features*, *scenarios*, and *steps* give the high-level limited-form 
  natural-language definition of aspects of the user story.
* *Step definitions* indicate how to translate the steps to procedure
  calls.  (Yay pattern matching!)
* *Support code* helps implement some of those caclls.
* The *automation library* deals with common things, like fetching pages.
  We often use Capybara to help with automation.

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

Cucumber in Practice
--------------------

* Our alums tell me that Cucumber has been less successful than
  people had expected.
* Ideal: Clients can write user stories. 
    * Reality: Clients can read user stories.
    * Reality: Programmers have to write user stories.
* "Natural language" descriptions seem like a good idea, but managing
  three sets of files (use cases, patterns that translate to real test
  code, real test code) can be problematic.
* Automatic database setup is nice, but there are other Gems, such
  as FactoryGirl, that also help with database setup.
* I will not require you to write explicit Cucumber tests, but I will
  expect you to write use cases and to write tests (in RSpec or Minitest)
  that correspond to those use cases.
