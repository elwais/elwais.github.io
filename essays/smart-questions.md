---
layout: essay
type: essay
title: "Programming Questions are Nontrivial Favors"
date: 2024-09-12
published: true
labels:
  - Opinion
---

"You've tried everything you could, you've asked everyone you could, and you
acknowledge that an answer is a gesture of kindness, not an obligation. Only
then, you may ask your question."

---

To a certain extent, that statement has been my attitude towards asking my
instructors for help with my homework assignments during university. I felt that
it'd be a tad rude of me to immediately ask for "help" without trying to solve
the problems myself, with friends, or with external tutorials and resources. In
practice, this had a few disadvantages, with a big one being an increased time
requirement for me to complete assignments. On the upside though, I found that
most instructors were very receptive to my questions. I assumed that was because
those instructors were just patient, but I recently realized that my attitude
towards asking questions may have positively affected their receptiveness. And
as it turns out, this experience isn't something that's unique to me.

## On "Smart" Questions

In 2001, Eric Raymond wrote an article titled "How To Ask Questions The Smart
Way," in which he roughly discusses ways programmers can seek help from other
programmers. That article has gone through several revisions, with the most
recent one being from 2014 that is available for reading
[here](http://www.catb.org/esr/faqs/smart-questions.html). Despite the article's
occasional explicit language and occasionally condescending tone, it contains
good rules of thumb to consider before, while, and after asking questions. As it
turns out, some of the rules that I've been applying myself align with what
Raymond wrote. As important as having receptive, useful responses were to me in
university, those useful responses were for me to understand the material and
get good grades. For software engineers however, I'd argue that asking those
"smart" questions as outlined by Raymond are even more powerful, as software
engineers are problem solver, and a helpful answer for a helpful question means
that there would be one less problem in the world sooner rather than later.

Now, Raymond only used logic, context, and common sense to justify why his
suggestions for questions would make them better, with anecdotes used for
illustrative purposes. I thought it'd be fun to grab two more anecdotes from
none other than Stack Overflow. In particular, I'll grab two examples: one
example will be of a "smart" question with favorable responses, and another of a
not-so-"smart" question with not-so-favorable responses. Though this certainly
won't act as definite proof that "smart" questions have a higher probability of
garnering favorable responses, it should serve as a modern anecdote to those
described by Raymond.

### Case 1: "How do you monitor the availability of multiple websites"

+ Asked 15 years, 11 months ago
+ Modified 10 years, 8 months ago
+ Viewed 2k times

---

I need to ensure that any number of websites and services haven't bitten the
dust. At the moment I rely on a simple 5 minute cronjob which uses curl and a
file of urls to check that all the responses are correct (200 or rarely 301).

It all works on a basic level, I'm interested in more sophisticated open-source
tools (statistics, response times, pretty graphs) - what do you use? 

---

For this question, we see that the author has provided more detail and context
as to the problem that they're trying to solve. They've also explained their
current process
