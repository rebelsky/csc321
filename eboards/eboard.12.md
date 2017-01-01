CSC321.01 2016F, Class 12: Software as a Service
================================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* DRY.
* Thinking about SaaS.
* Questions from the readings.
* Rails, revisited.

Preliminaries
-------------

### Admin

### Upcoming Work

* SaaSBook 8 for Friday.
* Saas HW 2 (Sinatra Hangman) for Monday.  (It's in "Intro to BDD, TDD,
  and SaaS" on the MOOC.)
* Reading Journal for Friday (due Thursday at 10pm)
    * Subject: Reading Journal for Class 13 (Your Name)
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

See <http://www.cs.grinnell.edu/~rebelsky/s2d@g/>

* Thursday at 11:00 a.m. Convocation on Gates.  (Not Gates Tower.)
* Thursday at 4:15 p.m. Thursday Extra.
* Tribute to Ornette Coleman 7:30 p.m. Friday in Herrick.  What can be
  better than a 40 minute Free Jazz piece!

### Questions

DRY
---

* Something we strive for in our code.
* Don't Repeat Yourself
    * That is, Don't Repeat Yourself
* What are ways in which we repeat ourselves as programmers?
    * Write the same exact code twice.  
         printf("x has value " + x);
      vs
         report(x);
    * Same data represented in multiple places.
    * Identical headers and footers on different Web pages.
    * Similar classes.
    * Similar documentation.
    * Program or write by copy/paste/change.  (Repeating similar code)
* There are times it's okay to be repetitious.  For example, if all of
  your functions have a local variable named `x`, DON'T MAKE IT GLOBAL!
* For identical code (and chunks of code): Make it a separate function.
* What unnecessary repetition appears in the following code?

        for (int i = 0; i < length(lst); i++) 
          {
            printf(lst.get(i));
          } // for

        for (int i = 0; i < length(lst); i++) 
          {
            printf(i + " of " + length(lst) + ": " + lst.get(i));
          } // for

        int len = length(lst);
        for (int i = 0; i < len; i++) 
          {
            printf(i + " of " + len + ": " + lst.get(i));
          } // for

    * print statement.  We avoided repeating overselves by putting it in 
      a loop.  Much better
         printf(lst.get(0));
         printf(lst.get(1));
         printf(lst.get(2));
         ...
    * Is it good to ask to repeatedly ask for the length?
        * Yes: The length might change.
        * No: The body doesn't change the length; we've potentially turned
          an O(n) algorithm into an O(n^2) algorithm.

* Ways to avoid unnecessary repetition.
    * Write a function to encapsulate identical code.
    * Use a loop!
    * Use a variable to name the result of a repeated function call.

        int min(int[] a, int n)
        {
          int result = a[0];
          for (int i = 1; i <= n; i++) {
            if (a[i] < result)
              result = a[i];
          } // for
          return result;
        } // min

        int max(int[] a, int n)
        {
          int result = a[0];
          for (int i = 1; i <= n; i++) {
            if (a[i] > result)
              result = a[i];
          } // for
          return result;
        } // max

    * What was bad about the code above?
        * Lots of extra lines!
        * The first one was buggy.  When we fix the bug, we have two 
          things to fix.
    * How do we write it only once?  Take a comparison function as
      a parameter.
        enum compare = { LARGER, SMALLER }
        int ultimate(int[] a, int n, compare comp)
        {
          int result = a[0];
          for (int i = 1; i < n; i++) {
            switch (compare) 
            {
              case LARGER:
                if (a[i] > result) result = a[i];
                break;
              case SMALLER:
                if (a[i] < result) result = a[i];
                break;
              default:
                break;
          } // for
          return result;
        } // ultimate
        int max(int[] a, int n) 
        {
          return ultimate(a, n, LARGER);
        }
        int min(int[] a, int n)
        {
          return ultimate(a, n, SMALLER);
        }

    * Issue: Is it better to repeat the for loop.

        int ultimate(int[] a, int n, comparator comp)
        {
          int result = a[0];
          for (int i = 1; i <= n; i++) {
            if (comp(result, a[i]) < 0)
              result = a[i];
          } // for
          return result;
        } // min

    * Ruby: Use yield in clever ways.
* Identical headers and footers on different Web pages.
    * Take advantage of your platform's support for that.  (Use rails.)
    * Generate your Web pages dynamically using php or shtml or ....
    * Use some tool that supports templating.
    * Write you own tool.
* Note: Make is designed to help you write DRY instructions.

* Similar classes.
    * Use inheritance.  Write a common superclass.
* Similar documentation.
    * Write the documentation once and write a short hyperlink to the
      common documentation.

Thinking about SaaS
-------------------

Questions from the Readings
---------------------------

_An idea I found confusing is the cookies. In my understanding, cookies allow the server to identify returning users.  What else am I missing?_

_How HTTP can be stateless but also use cookies?_

_I am having trouble understanding the relationship between marshalling and 
serialization. Serialization is when you turn an object into bits for 
storage.  How does marshalling differ?_

_What's the relationship between HTTP and URIs?_

_How do websites scale? It seems like they share the load of computations
over many virtual computers, but I'm not sure how all the information
is stored and computed cohesively._

_What's the relationship between the three-tier architecture and
MVC?  They seem very similar._

Rails, revisited
----------------

