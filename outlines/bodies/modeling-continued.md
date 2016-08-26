Bad Spuds, Continued
--------------------

Here's one solution to Bad Spuds.  We'll take a look at it.

Tables

* A _Movie_ table with 
    * Title
    * Rating
    * Release Date
    * Description
    * Reviews
* A _Reviewer_ table with 
    * Name
    * Description
    * Reviews
* A _Reviews_ table with 
    * Movie Title
    * Score
    * Reviewer Name
    * Description.

Relationships

* a one-to-many relationship between movies and reviews
* a one-to-many relationship between reviewers and reviews

Analysis
--------

Observation

* Is a review just a more complex many-many relationship between
  reviewers and movies?

Questions

* Is this DRY?  Why or why not?
* What types would you associate with these various fields?
* What other fields would you want in each table?
* What other tables would you want?
* What restrictions would you place on various relationships?  (E.g.,
  can the same reviewer review a movie more than once?)

A Revised Data Description
--------------------------

_We will build this on the fly._

Lessons
-------

_Forthcoming._
