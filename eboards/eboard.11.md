CSC321.01 2016F, Class 11: Modeling, Continued
==============================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Questions.
* Data Modeling.
* Exercise: A Sample Database Design.
* Analysis.
* Revisions.

Preliminaries
-------------

### Admin

* We're halfway through the course!
    * We need more homework please!
* I hope you had a good weekend.
* I spent Saturday at the second-year retreat and most of Sunday sick
  in bed, so I continue to be behind.
* Today will be one of those "Think about things and then report back"
  days.

### Upcoming Work

* For Wednesday: No additional reading.  Use the time to catch up in
  the two books!  And start Friday's homework.  (Thanks!)
* Reading Journal for Wednesday (due Tuesday at 10pm)
    * Subject: Reading Journal for Class 12 (Your Name)
    * Create what you think are appropriate models for alumni.grinnell.edu.
      (I'm okay if you describe them informally.)  Make sure that you
      indicate relationships.

### Good Things to Do

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Tuesday at noon: CS Table on IoT.
* Tuesday at 4:15 p.m. Thursday Extra on Robots.
* Thursday at 11:00 a.m. Convocation on Gates.
* Thursday at 4:15 p.m. Thursday Extra.

### Questions

Data Modeling
-------------

What is it?

* Storage and representation of data.
* Thinking about how we represent the data that are core to our
  application.
* There are many ways to model data.
* Two most popular
    * Relational
    * Object

What is relational data modeling (what is the "relation" in relational
data modeling)?

* Relation data modeling involves the use of "relations".  A relation
  is essentially a table with named/type columns.

        TABLE: FACULTY
        ID      LName           FName   Dept    HireYear
        032     Rebelsky        SA      123     1997
        033     Rebelsky        Casey   123     2020
        341     Walker          Henry   123     1970
        300     Stone           John            1971
        667     Latham          Mike    History 2014

* Each line represents one compound value.
* Each column represents one portion taken from each compound value.
* How we represent the data.
* Can involve uniformity of naming.
* We also have to consider relationships between our tables/relations.

        TABLE: DEPARTMENTS
        ID      Abbrev  HEAD            NumberOfMajors  
        123     CSC     032             83.5
        124     PHI     
        125     LIN

* Note: We use an ID number for the head
* Note: We try to keep this DRY, so we don't (usually) repeat data we
  can find elsewhere in the database, such as number of CS faculty.
* N primary steps in modeling the data for an application
    * Determine the primary kinds of data you store (faculty, department, ...)
    * Determine the appropriate fields/columns for each kind of data
    * Determine the relationships between kinds of data
    * (Add the data)
* Relationships between different tables.
    * 1:1   Every student has a po box.  Every box has a student.
    * 1:many Every student has a living space.  Each living space can
      have zero or more students.
    * many:many Every student can have multiple majors, ever major can
      have multiple students.
* In Rails, if you are careful about specifying these relationships, you
  don't have to worry about how precisely they are represented.
* In SQL (and many other situations), you do have to worry about representation
* 1:1 relationship: Merge tables.  Or have ids that reference back and forth.
* 1:many relationshp: Id of the the one in the many
* many:many relationship: Separate table

        TABLE: FACULTY
        ID      LName           FName   HireYear
        032     Rebelsky        SA      1997
        033     Rebelsky        Casey   2020
        341     Walker          Henry   1970
        300     Stone           John    1971
        667     Latham          Mike    2014

        TABLE: FACULTY/DEPARTMENT
        FACID   DEPTID
        300     123
        300     124
        300     125
        032     123
        033     123

* These tables are not convenient for human beings, but very convenient
  for computers.
* DBMS (Database management systems) are designed to help make sure that
  this stuff is implemented well (reliably and fast).  

What is a RESTful architecture?

* In part: A model of SaaS in which you can send queries via the Web and
  receive your data back.

Exercise: A Sample Database Design
----------------------------------

LibraryThing - A way for people to manage information about their 
personal libraries.

* What would you model.  And what are the relationships between these
  things?
* Things
    * Book
       * ID (e.g., ISBN)
       * Title
       * Author
    * BookInstance
       * BookID
       * AdditionalInformation (condition, ...)
    * Publisher
    * User
    * CheckoutRecord
    * Genre
       * Id
       * Name
    * Holds
       * BookId
       * UserId
       * HoldCreated:TimeStamp
* Relationships
    * Ownership: User:BookInstance 1:N
    * Booksinstances: Book:BookInstance 1:N
    * Book:Publisher N:1
    * Book:Author N:N
    * ...

Analysis
--------

* See above.

Revisions
---------

* See above.
