CSC321.01 2016F, Class 07: Ruby, Revisited
==========================================

_Overview_

* Preliminaries.
    * Admin.
    * Upcoming Work.
    * Extra Credit.
    * Questions.
* What is software engineering?
* Why study software engineering?  (Revisited)
* A few more notes on Agile programming.
* Web technologies.
* Ruby-isms and Rails-isms.

Preliminaries
-------------

### Admin

* Sam needs to ...
    * Fix the schedule for CSC 321
    * Fix the whole damn site for CSC 322
    * Write you knit tests
* Friday PSA.
* I seem to be missing a lot of journals for today.  Please be careful
  to work on those.
    * Please don't write "Message subject" as part of the subject.
    * Yes, you can catch up on late journals over the weekend.
* I've over-planned for today.  Expect some of today to spill into
  Monday's class.

### Upcoming Work

* For Monday: Write three user stories related to alumni.grinnell.edu 
  or grinnellconnect.com.  You can write from the perspective of a
  student, a faculty member, an alum, an administrator, etc.  (And
  yes, your stories can be from different perspectives.)
    * Message Subject: CSC 321 2016F: Reading Journal for Day 8 (First Last)

### Good Things to Do

* Cool concert tonight at 7:30 p.m. in Herrick.
* Cross country, 10 a.m. Saturday at Grinnell Golf Course.
* Football at noon Saturday.
* Prairie Meander peformance Saturday noon to 6pm, shuttles
* Cool concert tomorrow night at 9:00 in Gardner.  (Also talk at 4:20pm
  in JRC 225.)
* CS Table Tuesday: Data Privacy and Higher Education
* Spark Tank Tuesday at noon in ARH 102 (I think)
* CS Extras Tuesday at 7:30: Google!
* Convocation Thusday: Higher Education
* CS Extras Thursday: Internships

### Questions

What is Software Engineering?
-----------------------------

We should step back and ask ourselves the bigger question.  

*What is this thing, called "software engineering", that we are studying
this semester?*

* "An iterative process by which you develop software."  It's iterative
  because stuff changes.
* Not always iterative: See Waterfall, for example.
* The development of software (usually for a purpose)
* Organization and planning of development.
* Not just design, organization, planning, and development.  Also support.
* Systematic!
* An attempt to systematize all phase of the specification, design, design, 
  construction, deployment, maintainence, and revision of software.
* Formalize processes.
* Steal from engineering literature.
* ...

Why Study Software Engineering? (Revisited)
-------------------------------------------

We talked about this before, but it's probably useful to look at it again.

*Why are we studying it?  (Why do most institutions include it in their
curriculum?)*

* Some of us are going to industry where we'll build software.  We should
  know someting a bit more about building software.
* Gives us good ways to tackle certain kinds of problems and code more
  effectively.
* Computer science is a discipline that involves both theory and practice.  
  We expect that our graduates know something about practice.

More on Agile
-------------

A few things for us to talk about.

### Review: Important Agile Practices

* Short iterations
* Focus on working code, rather than big picture issues.
* Pair programming
* Test-driven development (or at least test-centric development)
* Refactor!
* Regular communication with the client
    * To validate/check what you've been doing
    * To confirm/reconfirm that you understand their goals and that
      your approach meets those goals.
    * To identify high priorty tasks
* Reprioritize regularly
* Stand-ups
* Identify digestible tasks.  
    * Break larger ones into smaller ones.
    * Usually phrased in terms of user stories.
* Attempt to quantify the rate at which you can develop software.
* Common code base

### Context

What are some advantages of agile?

* Fail faster.  You see where your code breaks quickly.
    * You see where you've failed to understand the client more quickly.
* Clients are clueless.  What they tell you that they want isn't really
  what they want, but they won't realize it until they play with your
  software.
* Get a product up and running faster (MVP).
* Easier to time-box.  (In happy fairy tale land.)
* Better customer relations.

What are reasons that people would denegrate agile?

* Some projects sometimes require careful designs, agile can undermine
  those designs.
    * Think about making a fancy dinner vs. the Marketplace approach
* Doesn't scale well to large projects.  Agile can work for 50.  It
  probably doesn't work for 5000.
* Harder to set a particular price.
* May be harder to say "I'm done."  Short iterations give temptation for
  feeping creaturism.
* More time with annoying customers.
* Some customers like formal documentation.  (Primary example: US Gov't.)
* Most programmers like real documentation.  Tests are not documentation.
* It's not "Engineering"
* It doesn't lead to formally verifiable software.

Software As A Service
---------------------

What is it?

Why do we like it?

What are the ethical challenges of SaaS?

Web Technologies
----------------

*Aka HTML 5, XML, and a history of the Web.*

Pre-web.  Need a language for describing documents that incldues not only
content but also format information.  SGML.  A language that let you design
languages that described documents.  Tags.  `<para>` means start of paragraph,
`</para>` means end of paragraph.

Early web.  HTML (a way to mark up documents) and HTTP (a protocol for
requesting and sending documents).

Web growth.  We don't just want static documents.  We want interactivity
and custom documents.  

* Back-end approaches: Programs can generate Web pages, rather than having
  static Web pages.  
* Required slight changes to Web server software.
* Lots of languages: Perl, C
* Grew to Web-oriented languages: PHP
* For interactivity on these static Web pages: Embed applications!
  (Java,Flash)

More Web growth.

* We need a way to script pages (front-end) so that we can modify content.
  JavaScript

HTML5: The primary Web technologies.

* HTML: Markup language to describe roles of content
* CSS: Language to describe appearance of the different kinds of content
* JavaScript: Language to describe modifications to ^
* DOM: Object-oriented description of an HTML page.
* HTTP: Protocols for communication.
* Plus too much on the back-end (e.g., Rails)


Some Ruby-isms, Rails-isms, and More
-------------------------------------

### Ruby != Rails

In answering questions, some of you seemed to conflate Ruby and Rails.
Ruby is a general-purpose programming language.  Rails is a Web
application development infrastructure that happens to use Ruby for its
programming aspects.  (At least one of you also asked about HTML.)

### Syntax

The most difficult aspect of Ruby was digesting the syntax. 

### Refactoring

One of the aspects that I find the most confusing about Ruby is the
aspect that I also find fascinating. The ability to refactor code and
make it much more concise. I understand that most of the code in Ruby
can be made more concise than in other languages, but I do not know how
to do so as I am very new to the language and do not know many of the
ways to refactor. I would like to learn more about how I can rewrite
code so that it is still easily understandable, but much more concise.

### Migration

What is it exactly?  Why is it useful?

### Hard to parse

The calling of functions using left shift bitwise operators confused me
because I’m surprised why you just can’t call using function names
and just append the strings together using the ‘+’ operator.

### Metaprogramming

I don’t really understand how you can generate code at runtime yet
you write the code before you run the program. Is there a way to go to a
program that is already running and change the code and then the program
changes the way it executes.

The concept of metaprogramming is sort of difficult to understand. What
are some more examples of metaprogramming?

### Duck Typing

What is it?  How does it relate to key oop principles?

### `yield`

I am still working to understand what “yield” does. According to the
reading, yield is commonly used with iterators. Once in the scope of the
iterator, code is executed until it reaches yield.  Then, any arguments
given to yield are then used as arguments in the block of the iterator. I
still do not understand why this is more or less useful to program with.

### Scaffolding

Scaffolding continues to confuse me, though I'm slightly less confused
as to why it's a good teaching tool.

### Mix-Ins

I think I understand in a broad sense how mix-ins work, but I’m fuzzy
on how they work syntactically in code. I’m not sure I would recognize
them if I was looking at a program that used them. I understand that
modules are included using the keyword include, but I’m not sure where
mix-ins are included in Ruby code. I’m also not sure how yield works,
even though it seems pretty intuitive, I’m just not sure if I would
be sure when to use it.

