---
layout: essay
type: essay
title: "Join a Committee... and Leave as Fast as Possible"
date: 2024-09-26
published: true
labels:
  - Software Engineering
---

I was going through some material from a course I took last semester at the time
of writing. That course was EE-205: Object-Oriented Programming, designed for
computer engineering majors. At the time, I wasn't a computer engineer but still
opted to take it because I wanted to improve my ability to code. (Though, that's
a story for another time.)

I bring this up because of something that I'm *certain* my instructor mentioned,
but I just couldn't find. He was providing a list of things every developer
should aim to do in the future, and these were 2 of the items that I recall
seeing on that list:

---

+ *Join a language/standards committee.*
+ *Leave that committee after a few months.*

---

## Why Join and Leave?

With no context or explanation, I found those points to be very confusing! After
all, why would one go out of their way to join a committee that can dictate the
fate of something used by many software engineers around the world, only to rush out
after a certain time limit had elapsed? My instructor then explained that this
brief stint in the committee had a very specific purpose: to learn about the
decisions behind design choices *without getting too attached*.

I'd like to tease that reasoning apart a bit more, and start why one would even
want to understand design choices in the first place. In particular, I'll be
considering coding standards.

## Why Standards Matter

Personally, I think standards matter because of 2 things: uniformity and
quality.

The former is something that most of us tend to like without realizing. Whether
it's the lack of inconsistency that makes us feel that we have control in our
lives or the uniformity of what we see (think of a rustic home that is rustic
everywhere, or a high-end restaurant that has nary a speck of dust or dirt
anywhere).

The latter is something that I'd imagine is much more obvious. Though it may be
hard to agree on what good code is, it usually isn't too hard to agree on what
code is bad. This is the case for people that have experience working with the
language and on projects in a particular language, but may not be as obvious to
people that are trying to get up to speed on that language. This is something
that's especially helpful with coding standards, as there are tools that are
able to notify deviation from those standards and --- in some cases --- modify
the code to automatically conform to the standards (not unlike autocorrect on a
syntactic and stylistic level).

## Why Standards Must *Not* Become Dogma

Standards are great at creating uniformity that converges on quality code... but
what exactly is "quality?" Why should one set of guidelines be adhered to over
another? Most of the time, it all comes down to preference and taste, and as a
result, you get a myriad of conflicting standards. For instance, I had to use
the Airbnb style guide for my ICS-314: Software Engineering class, which
enforces the use of trailing commas and double quotes... whereas Prettier (also
required for this class) enforced the use of no trailing commas and single
quotes. When following the configuration guide for my class, there was a point
in which saving a file would cause prettier to format code in ways that went
against ESLint, essentially putting me in a loop of fixing an error, saving the
file, and having the error return, before either repeating the process or
manually creating configuration to work around that.

(Fortunately, most tools are aware of the fact that quality is subjective and will
provide ways to configure them to behave as desired. Prettier for instance
allows you to create `.prettierrc` files that can change the rules used to
format code.)

## How that Extends to Tools that Enforce Standards

Frankly, the approach software engineers will take in working with those tools
will come down to whatever makes them work optimally. For me personally though,
I don't find it particularly encouraging or helpful when I'm being blasted with
numerous linting errors due to the fact that my non-void function lacks a return
statement --- especially since that return statement is something that I was
planning to write eventually.
