Behavior-Driven Development
---------------------------

* What do you see as the key features of BDD?
* What's the difference between BDD and TDD?
* Some folks have suggested that we replaced TDD with BDD.  Does that
  seem like a good idea?  Why or why not?

Cucumber
--------

Let's walk through some scenarios and think about what work we'll have to
do to implement these Cucumber scenarios.  In particular, do we change
model, view, or controller?  Do we have to add any step definitions.
And how do we change whichever we change?

We'll work conceptually for the first hour and then give you a chance
to work on the homework together in the second hour.

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
