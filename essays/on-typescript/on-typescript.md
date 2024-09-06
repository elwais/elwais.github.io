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

## An Example

Consider the following bit of Typescript code I wrote this week in a timed programming
assignment.

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
    // Bad type declarations   ^                ^
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
syntax slip-ups I had been making.
