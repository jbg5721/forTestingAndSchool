# Joey Gardiner XPath 1

## 1
a.  `//head[contains(string(), "Act")]` is an expression I used to find all the acts and scenes. Something I found that actually worked better was this `//div[@xml:id ne "sha-temcast"]` With this you can just look at each div that contains each specific scene and act.

b. `//body/div/head` I used this to find just the acts. 

c. `//head[contains(string(), "Scene")]` is what I used to find only the scenes.

d. `//head[contains(string(), "Act 2,")]` I used this to find just the scenes inside act 2. As expected there were 2 results.

## 2
a. `//stage` is what I used to find 149 different stage elements throughout the document.

b. `//div[@xml:id eq  "sha-tem3"]//stage` is what I used to find all the stage directions in ACt 3, there were 32 results.

c. `//l/stage` is what I used to find all the stage elements in the I elements. There are 79 results.

d. `//sp/stage` is what I used to find all the stage elements in the sp elements. There are 48 results.

e. `//div/stage` found 22 results. These were all stand alone stage directions in the div element.

f. I believe this is the same as E, so `//div/stage`. So the same results of 22.

## 3

a. `//sp/@who` can be used to look at each individual who attribute.

b. `//sp[@who = "Prospero"]` Using this I get 114 results. When using the same string but for Miranda: `//sp[@who = "Miranda"]` I get 50 results.