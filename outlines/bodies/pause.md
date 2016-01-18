Code smells
-----------

* What are they?
* Why do we care?
* What are some useful smells to look for?
    * SOFA (or the inverse thereof - LMMC)
    * What are smells that *you* look for?
    * How do we make things smell better?
* At what level do we look at smells?

Designing databases
-------------------

* We are dealing with relational databases.
* What's a relation (or relationship)?
* What kinds of relations are there? 
    * We'll try to do examples of each.
* How can you more efficiently access some aspects of databases?

Big Picture: Rails Apps
-----------------------

What are the primary components of a Rails app, where do they go, and
how do they communicate?

* Model: Objects that describe rows in a table in the database.  Mostly
  automatic, although we write some methods.  Live in `app/models`.
* Views: Show how to display certain kinds of pages.  Live in
  `app/views/app/page.html.haml`.
* Controllers: Methods in the controller.
* Controller: 

Medium Picture: Collaborating with Other Services
-------------------------------------------------

* The real Web is distributed.
* How do we achieve things like authentication?

TDD and BDD, revisited
----------------------

From your perspective, what is the way that Fox and Patterson think that
you should interact?  Here's mine:

* BDD suggests a set of behaviors.
* Each behavior requires you to implement some underlying procedures.
* You use TDD to implement those procedures.

What problems did you encounter in trying to do the latest homework
assignment?

Migrations
----------

I found this guide particularly helpful: <http://guides.rubyonrails.org/active_record_migrations.html>.

Here's my migration

    class AddDirectorToMovies < ActiveRecord::Migration
      def change
        add_column :movies, :director, :string
      end
    end




