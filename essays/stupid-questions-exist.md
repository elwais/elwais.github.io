---
layout: essay
type: essay
title: "There is Such a Thing as a Stupid Question"
date: 2024-09-12
published: true
labels:
  - Opinion
---

"You've tried everything you could, you've asked everyone you could, and you
acknowledge that an answer is a gesture of kindness, not an obligation. Only
then, you may ask your question. After all, there is such a thing as a stupid
question."

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
described by Raymond. I selected 2 interesting questions from
[here](https://stackoverflow.com/questions/tagged/website-monitoring), listed
some of their metrics, and the actual question itself. Let's see how they fare!

### Case 1: "How do you monitor the availability of multiple websites"

+ Asked 15 years, 11 months ago
+ Modified 10 years, 8 months ago
+ Viewed 2k times
+ 7 votes
+ <https://stackoverflow.com/questions/tagged/website-monitoring>

---

I need to ensure that any number of websites and services haven't bitten the
dust. At the moment I rely on a simple 5 minute cronjob which uses curl and a
file of urls to check that all the responses are correct (200 or rarely 301).

It all works on a basic level, I'm interested in more sophisticated open-source
tools (statistics, response times, pretty graphs) - what do you use? 

---

For this question, we see that the author has provided more detail and context
as to the problem that they're trying to solve. They've also explained their
current process, which demonstrates that they've already put in their effort.
Their last sentence also implies that the author is not intending for having
their problem solved completely by the people that answer, but is simply looking
for some direction to continue putting in the work. This has garnered 5
responses, two of which have upvotes around 8 times that of the others (implying
relatively high-quality answers).

### Case 2: "Monitor urls using c#"

+ Asked 9 years, 3 months ago
+ Modified 9 years, 1 month ago
+ Viewed 4k times
+ 0 votes
+ <https://stackoverflow.com/questions/30574488/monitor-urls-using-c-sharp>

---

I am developing asp.net website for url monitoring. I looked around for open
source tools and none of them provide restful APIs so that they can be called
from my application. Are there any open source packages that I can directly use?

Thanks.

---

Now, this question isn't one that's terrible. The author states that they've
looked around, which is a good start. However, it looks like the author was
asking for a specific way (open source packages) to do a specific thing
(`asp.net` website for URL monitoring). One of the responses roughly states that
it's not possible due to the fact that packages are local ("you want to do Y
with X, but that's not possible, and you need to use a Z instead of an X"). The
sole other response simply provides a link to other forum posts, implying that
the question author didn't do enough research into the question before asking.

What I find most interesting is that Case 2 had a much more lackluster response
than Case 1 despite having double the views. This implies that many people read
the question and simply decided that it wasn't worth their time.

## Moving Forward with the Idea that Stupid Questions Exist

I guess this little adventure didn't teach much that's new, but did solidify
that feeling of approaching others and asking questions with effort and
sincerity. I personally will continue to do my thing of bashing my head against
the board before asking for help, and I'd like to continue that in the future
with my other endeavors as well --- especially for software. (I don't think it's
a good idea to be dogmatic about this since there can be nontrivial drawbacks to
this kind of approach, but that discussion may be best saved for another time.)
