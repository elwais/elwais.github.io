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

Consider the following bit of code I wrote this week in a timed programming
assignment:

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

<!-- Ever since I first grasped a paintbrush, I’ve always been eager to learn about -->
<!-- design. Design is such a complex concept. For example, when looking at abstract -->
<!-- art, its meaning can be completely different for different people. It motivates -->
<!-- a person to think thoughtfully and has the potential to submerge them in a sea -->
<!-- of imagination. It’s that special relationship between the viewer and the art -->
<!-- that makes something as technical as software engineering interesting to me. -->

<!-- I never used to think that design and technology went hand in hand.  Thus, -->
<!-- learning about software engineering and the role of design has been incredibly -->
<!-- interesting to me. Design, implementation, and management are just some of the -->
<!-- many things I wish to learn more about. Good art, in a way, makes a person -->
<!-- question it. They become joined in the idea of visualization – where captivation -->
<!-- meets inspiration. -->

<!-- I am now starting to take a Software Engineering class. I hope to learn a lot -->
<!-- through the course, but I know it will be just the beginning of my journey. By -->
<!-- the time I’m done with it, I hope I’ve learned enough to take the next step in -->
<!-- my life as a developer. But until then, my fire will keep on burning. -->
