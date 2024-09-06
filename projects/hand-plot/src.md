---
title: hand-plot.py
---
```python
from numpy.random import choice
from numpy import linspace, mean
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

stdevs = linspace(0.1, 1, 10)

men = pd.read_csv("ansur_men.txt", sep='\t', header=0,
                  usecols=["HAND_BRTH_AT_METACARPALE", "HAND_LNTH"])
women = pd.read_csv("ansur_women.txt", sep='\t',
                    header=0, usecols=["HAND_BRTH_AT_METACARPALE", "HAND_LNTH"])
women.drop(choice(women.index, 434, replace=False))

df = pd.DataFrame(data=pd.concat([men, women], axis=1, join="inner"))
del men, women

df.columns = pd.MultiIndex.from_product(
    [["Male", "Female"], ["Breadth", "Length"]])

fig, ax = plt.subplots(figsize=(6, 6))

sns.scatterplot(data=df["Male"], x="Breadth", y="Length", s=3)
sns.scatterplot(data=df["Female"], x="Breadth", y="Length", s=3)

df_concat = pd.concat([df["Male"], df["Female"]])

sns.kdeplot(data=df_concat, x="Breadth", y="Length", levels=stdevs, cmap="magma",
            linewidths=1)
sns.regplot(data=df_concat, x="Breadth", y="Length", scatter=False,
            line_kws={"linewidth": 1}, color="blue")

# Find averages
male_avgs = [mean(df["Male"].loc[:, "Breadth"]),
             mean(df["Male"].loc[:, "Length"])]
ax.scatter([male_avgs[0]], [male_avgs[1]], label="Male Avg", color="blue", s=32,
           marker="x")

female_avgs = [mean(df["Female"].loc[:, "Breadth"]),
               mean(df["Female"].loc[:, "Length"])]
ax.scatter([female_avgs[0]], [female_avgs[1]],
           label="Female Avg", color="orange", s=32, marker="x")

# My hand is 88 mm wide and 185 mm long
ax.scatter([88], [185], label="Me", s=32, color="red")
ax.scatter([81], [195], label="McBain", s=32, color="magenta")

ax.set(
    xlabel=r"Hand Breadth (mm)",
    ylabel=r"Hand Length (mm)",
    title=r"Male and Female Hand Breadths and Lengths"
)
ax.grid()
ax.legend()

plt.show()
```
