---
layout: essay
type: essay
title: "Typescript: So Close and Yet So Far from My C and Python Parents"
date: 2024-09-05
published: true
labels:
  - Software Engineering
  - Learning
---

<figure>
  <center>
    <img width="256px" src="./logo.png">
    <!-- <figcaption> -->
    <!--    A quick demo of <tt>calnext</tt> and <tt>calmod</tt> which compose -->
    <!--   <tt>cal-suite</tt>. -->
    <!-- </figcaption> -->
    </center>
</figure>


Who knew that a language that felt a lot like my 2 favorite ones would end up
being harder than the both of them? Consider the following bit of Typescript
code I wrote this week in a timed programming assignment.

```typescript
function temperatureConverter(int temperature, str temperatureType) {
    if (temperatureType == "F") {
        return (temperature - 32) * 5/9;
    } else if (temperatureType == "C") {
        return (temperature * 9/5) + 32;
    }
    else {return "Illegal temperature type"}
};
console.log(temperatureConverter(212, "F"))
console.log(temperatureConverter(0, "C"))
console.log(temperatureConverter(-40, "F"))
console.log(temperatureConverter(-40, "X")
```

See the problems and non-idealities? Let me comment them in for clarity.
```typescript
function temperatureConverter(int temperature, str temperatureType) {
    // Bad type declarations   ^ here           ^ and here
    if (temperatureType == "F") {
        return (temperature - 32) * 5/9;
    } else if (temperatureType == "C") {
        return (temperature * 9/5) + 32;
    }
    else {return "Illegal temperature type"}  // No semicolon
};
console.log(temperatureConverter(212, "F"))  // No semicolon
console.log(temperatureConverter(0, "C"))  // No semicolon
console.log(temperatureConverter(-40, "F"))  // No semicolon
console.log(temperatureConverter(-40, "X")  // No semicolon
```

In **Typescript**, I incorrectly pulled in **C**-style typing (`type val`
instead of `val: type`) and neglected semicolons for lines that resemble
**Python**. The semicolons weren't an issue thanks to Typescript's automatic
semicolon insertion, but that inconsistency leads to marginally confusing code
and a potential for bugs. My partner during the assignment --- thank goodness I
had his help --- ended up acting as my Typescript Language Server with all these
syntax slip-ups I had been making. This was due to the fact that most of the
code I have written has been in C and Python, and my pattern-identifying
behavior wound up making logical leaps and jumps that weren't all that accurate
and valid.

---

That being said, I don't think that the language is terrible, as my own problems
were a product of my own experience with other languages. (It certainly looks
easier than the [parentheses-happy Common
Lisp](https://en.wikipedia.org/wiki/Common_Lisp#Syntax) in my eyes.) For now, if
I'm just mindful of the fact that I shouldn't treat Typescript as C or Python,
I'm certain that I will learn a lot from the language that helps power much of
the web.
