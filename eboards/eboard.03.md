CSC321.01 2016S, Class 03: Your First Rails Application
=======================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* Reflections from classes 1 and 2.
* Activity: Building a toy app.
* Debrief.

Preliminaries
-------------

### Admin

* I was having trouble running Rails on C9 this morning.  Let's hope 
  that things are working better.  (My attempt to run Rails reasonably
  on MathLAN failed.)
* Attendance.
* Friday PSA.

### Upcoming Work

* For Monday: Finish Chapter 2 of Hartl (including all construction).
    * Send me an invitation to your c9 repository.
* For Monday: Reading Journal
    * Message subject: CSC 321 Journal for Day 4 (Your Name)
    * What do you see as the advantages and disadvantages of using
      scaffolding?
    * Pick three files created by the scaffold command (ones that Hartl
      doesn't describe) and do your best to describe them concisely.
    * What is something you found particularly confusing or puzzling in
      the reading?
* For Monday: Do the setup for Chapter 3.
* For Wednesday (start early):
    * SaaSbook: Chapter 1 and sections 10.1-10.2, 7.1, 7.3-7.4 

### Good Things to Do

#### Academic

* CS Table Tuesday.  (Facebook)
* CS Extras Thursday.  (LaTeX)

#### Peer

* Track meet on February 6.
* Caucus on Monday night.

### Questions

Question from classes 1 and 2
------------------------------

_Why deploy to Heroku?  Why not just use c9 for your work?_

> Um ... not sure.

> It lets you identify issues that might occur when someone else tries
  to install your Web application.

> c9, at least as we use it, is for simple development.  It will not scale.
  It has *very* limited resources.  Heroku is scalable, reliable, etc.

> It's good practice to know how to deploy to a real cloud service.

> "Everyone" deploys their Ruby apps to Heroku.

> Learning to separate development from deployment.
  
_Why didn't my app work on Heroku?  It was complaning about SQLite or 
 something._

> Maybe something is messed up with SQLite.

> There was a setup where we had to add a special gem for deployment.
  (Some Gems don't work on Heroku, particularly the SQL gem we use on cloud 9.)
  For c9, use SQLite.
  For Heroku, use PostgreSQL.

_How many points will I lose by forgetting to do my journal on time?_

> Approximately 20 journal entries for 30% of your grade.  Each is worth
  1.5% of your grade.  So do them late and only lose a little.

Activity: Building a toy app
----------------------------

* If you are using Github and don't have a keypair set up, you'll need
  to use a http-style Github address, rather than a git-style address.
* If you are using Github, you probably have to type `git push -u origin master`
  rather than whatever they had for Bitbucket.

Debrief
-------

* It's worth the time to set up a keypair.  It makes it much faster to
  push to your repo over the long term.
