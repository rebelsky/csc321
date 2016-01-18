CSC321.01 2015F, Class 05: Ruby on Rails, Continued
===================================================

_Overview_

* Preliminaries.
    * Admin.
* Thinking about adding features.
* Adding a sort feature.
* Adding a filter feature.
* Adding simple persistence.
* Adding complex persistence.
* Putting it all together.

Preliminaries
-------------

### Admin

* We are continuing to hit transition problems.  I'll do my best to
  help you work through them.
    * We'll work through the rest of HW2 in class today.
    * I have time reserved on Saturday to work through the new Chapter 7 
      examples (hopefully in advance of when you'll be doing them).
* We will be temporarily skipping over chapters 5 and 6 to move on to BDD.
    * Because we have a half-class, we may not come back to chapter 6.
* No matter what it says online, your next homework is at
  <https://github.com/saasbook/hw-bdd-tdd-cycle>.  
    * When cloning, clone `hw-bdd-tdd-cycle`, not `bdd-tdd-cycle.`

### Questions

_Can we feel free to ignore the stupid things on the Web site?_

> Yes.

_Will you ever fix the quizzes?_

> Maybe.

Thinking about adding features
------------------------------

* Remember: Rails uses MVC 
* Every feature change suggests that you ask
    * Do I have to change the model?  If so, how?
    * I probably have to change the controller.  How?
    * Do I have to change the view?  If so, how?
* How does the view communicate this to the controller?
    * Through the URL or the query string

Adding a sort feature
---------------------

* Changes to the model?
    * Nope.
* Changes to the controller?
    * We'll need to change the part of the controller that makes the
      list of movies.
    * Was `@movies = Movie.all`
    * Replace by `@movies = Movie.order(:title => :asc)`
* Changes to the view?
    * Trigger in the view to set off the controller
       * Change the link
         `%th{:class => title_header, :id => "Title"} = link_to "Movie Title", movies_path(:sort_by => 'title')`
       * Generates
         `<th class="..." id="Title"><a href="...">Movie Title</a></td>`
    * Visual feedback as to the change
* Communicate changes
    * Different URL
    * params[:sort_by]

Adding a filter feature
-----------------------

* Changes to the model
    * The model needs to tell us what the valid ratings are
        class Movie < ActiveRecord::Base
          def self.all_ratings
            ["G", "PG", "PG-13", "NC-17", "R", "Z"]
          end
        end
* Changes to the controller
    * Get information from the view (`params[:ratings]`)
    * `Movie.where(rating: ...).order(...)`
    * Communicate the valid ratings to the view
      `@ratings = Movie.all_ratings`
* Changes to the view
    * Add a way to select filtering criteria (in the assignment)
    * Add that to the queries we make (need to Google forms in 
      haml)
    * Have the controller communicate back to us which of the ratings
      are selected

Adding persistence
------------------

Putting it all together
-----------------------

