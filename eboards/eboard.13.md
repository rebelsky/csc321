CSC321.01 2016F, Class 13: Behavior-Driven Development
======================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* TDD Basics.
* BDD Basics.
* Cucumber Basics.
* A Cucumber Example.
* Cucumber in Practice.

Preliminaries
-------------

### Admin

* Prospective.
* Friday PSA.
    * https://prezi.com/dz6cu1yr83zn/what-does-consent-look-like/
    * http://www.theline.org.au/is-this-consent
    * https://www.youtube.com/playlist?list=PL3xP1jlf1jgJRkChwVOlwQcV0-UqcWiFV
* Cash for Dari Barn
* I've heard from the SEPC that "CSC 321 feels like CSC 151 in that we're 
  learning things that we'll never use."  
     * I hope that you will learn a lot about software design in this course, 
       and even if you don't use Rails again, the experience of thinking 
       through the steps of building and installing sites will be useful.  
     * Note that the ability to roll out an interactive site in a few hours 
       is a great way to build a portfolio.
     * And CSC 151 is useful.  As a recent alum said "151 teaches you most
       of the things you should know about Javascript."

### Upcoming Work

* Saas HW 2 (Sinatra Hangman) for Monday.  (It's in "Intro to BDD, TDD,
  and SaaS" on the MOOC.)
* Readings for Monday:
    * Don Gotterbarn, Keith Miller, and Simon Rogerson (October 1999). Computer Society and ACM approve Software Engineering Code of Ethics. IEEE Computer 32(10): 84-88.  <https://www.computer.org/cms/Computer.org/Publications/code-of-ethics.pdf>
    * Peter G. Neumann (February 2015). Inside Risks: Far-sighted thinking about deleterious computer-related events. CACM 58 (2): 30-33. <http://www.csl.sri.com/users/neumann/cacm235.pdf>
    * ACM Council (October 1992).  ACM Code of Ethics and Professional Behavior. <http://www.acm.org/about/code-of-ethics/>
* Reading Journal for Sunday night at 10pm.  (Questions inspired by JLND.)
    * Subject: Reading Journal for Class 14 (Your Name)
    * What was the most familiar idea in today's readings on ethics? Where had you seen that idea before?
    * What surprised you the most in today's readings on ethics? Why was that idea surprising?
    * Are there ways in which agile practices help support ethical behavior or make it more difficult?
    * Any other reactions or points you would like to discuss?

### Good Things to Do

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Jazz ensemble tonight at 7:30 in Herrick
* Faculty recital Saturday at 7:30 in Bucksbaum
* Film plus discussion Saturday at 4:00 in JRC 101.
* 1pm Saturday Harris: Howard Hawks' _Bringing up Baby_.

### Questions

* Sam needs to talk about scaffolding and proxies and mocks and
  such for TDD.

TDD Basics
----------

* As you design algorithms, you should design tests to make sure that
  your algorithms work correctly.
    * And run the tests.
    * And document your algorithms so that you know what they're supposed
      to do.
    * We should write lots of kinds of tests: "Normal" cases, "Edge"
      cases, "Corner" cases.
        * Edge and corner cases are things like maximum/minimum.
    * Multiple kinds of tests
        * Unit - Individual object, or function or ...
        * Functional - Ability to perform a subset of tasks
        * Integration - Ability of the program to form as a whole.
    * Write clear box tests that ensure that you have code coverage.
    * We could also write formal proofs that our programs are correct.
* One way to test: Print statements or "run the program on this input
  and read this output".
* How does unit testing differ from 161 testing?
    * It's automated.  The test framework either says "All tests passed"
      or tells you which ones didn't pass.
    * That means that when you rerun tests it's faster to get them
      to run the second (and third, and fourth, and fifty-third) time.
    * We might generate our tests with loops.
    * If we write tests first, we can check how well we're doing as
      we go.  And we'll kind of know what's wrong.
    * Humans are lazy and forgetful.  They won't keep running all of the
      tests, either because it takes time or because they don't remember.
    * Programming as video game.
       * I passed one test!
       * I passed two tests!
       * Game over.  You failed.
* Goal in most modern languages/environments
    * A way to specify easily inputs and expected outputs.
    * A framework that runs those specifications.
* Helps you document and think about goals.

BDD Basics
----------

* Behavior-driven development.
* Take user stories and use them to make SMART goals
    * SMART = specific, measurable, attainable, relevant, time-bounded
    * E.g., "As a user of Google I want to log in to Google so that
      Google can record my every move and thereby give me better 
      advertisements."
    * More generally, "As a ROLE, I want to ACTION, so that I can GOAL."
* Drive your coding based on the stories.  That's how you decide what
  tasks to work on next.
* We can write tests based on (very specific) user stories, rather than 
  on individual functions.

Cucumber Basics
---------------

* BDD framework for Rails (and other systems)
* Key idea: The user stories are written in a formal language that is
  both computer and human readable.
    * Computer readable: It can be our test (or can be translated into
      a test).
    * Human readable: Our clients can read our tests!

A Cucumber Example
------------------

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

* 2.5 years ago, when this class started, the alums (and Janet)
  promoted Cucumber.
* Our alums tell me that Cucumber has been less successful than
  people had expected.
* Ideal: Clients can write user stories. 
    * Reality: Clients can read user stories.
    * Reality: Programmers have to write user stories.
* "Natural language" descriptions seem like a good idea, but managing
  three sets of files (use cases, patterns that translate to real test
  code, real test code) can be problematic.
* Issue: Slow!
* Automatic database setup is nice, but there are other Gems, such
  as FactoryGirl, that also help with database setup.
* I will not require you to write explicit Cucumber tests, but I will
  expect you to write use cases and to write tests (in RSpec or Minitest)
  that correspond to those use cases.
* SS says "We wrote a lot of cucumber tests.  It was annoying."

How do we run tests when we haven't written the code to test?
-------------------------------------------------------------

* Write methods that don't really work.  "Stub methods."

        int square(int x) { return 0; } // STUB
        assert(square(0) == 0);
        assert(square(5) == 25);
        assert(square(INT_MAX) == INT_MAX*INT_MAX);  // DUMB TEST
        assertFailure(square(INT_MAX));
