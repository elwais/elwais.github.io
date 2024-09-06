---
layout: project
type: project
image: projects/hand-plot/thumb.png
title: Hand Plot
date: 2024-08-05
published: true
labels:
  - Python
summary: "A plot made to better assess the risk of hand injury from a keyboard"
---

<figure>
  <center>
  <object data="./hand_plot.pdf" height="500px" width="700px" type='application/pdf'></object>
    <figcaption>
      PDF rendering of <tt>hand_plot.py</tt>.
    </figcaption>
    </center>
</figure>

To make sure that I didn't make a hasty purchase of the [ZSA
Moonlander](https://www.zsa.io/moonlander), I decided to remake [Miles McBain's
plot](https://www.milesmcbain.com/posts/zsa-moonlander-review/#tenting-and-thumb-cluster)
of [ANSUR II](http://mreed.umtri.umich.edu/mreed/downloads.html#ansur) hand
sizes to assess how "average" my hand proportions were. This resulted in a
Python plot that made use of some of its data visualization libraries to create
a pretty and informative graphic that somewhat highlights the not-as-bad
deviation my hands have from the average of the dataset.

This little project was done by myself over the course of a few days, with most
of the work being done on the plane ride to Honolulu in anticipation of the Fall
semester starting up.

This project served as a "sequel" to the [`cal-suite`](../cal-suite/cal-suite)
project I've been working on earlier, as I wound up using most of what I had
used then, plus the [seaborn](https://seaborn.pydata.org/) library for plots and
[pandas](https://pandas.pydata.org/) for data. Those packages introduced me to a
much more high-level approach to plotting data
