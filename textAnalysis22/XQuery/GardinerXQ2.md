# Joey Gardiner XQuery 2

## 1

a. 
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
return $plays
```
Starting off, this is what I have. It just returns everything.

b. 
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker
return $speak
```
Using this I get 31054 results. When adding the `=> count()` at the end of speaker I get 1 result but it just tells me how many speaker elements are in the documents, which is still 31054.

c. 
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker => distinct-values()
return $speak
```
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker
let $dist := $speak => distinct-values()
return $dist
```
I wrote two just to see if there would be a different but these both do the exact same thing. You get every individual speaker one time. So there are 966 results. I didn't look through every single one of the results but it seemed to do a good job. There is one example, result #66, that had a period included in the name but that was the only occurance I found of that.

d.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker
let $dist := $speak => distinct-values() => count()
return $dist
```
When counting them I get 966 results again.

e.

a.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker
for $p in $plays
return $plays
```
b.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
let $speak := $plays//speaker
for $p in $plays
let $mt := $p//titleStmt/title
return $mt
```
This does work. I get 42 results.

c.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
(:  :let $speak := $plays//speaker 
let $dist := $speak => distinct-values() :)
for $p in $plays
let $distT := $p//titleStmt/title
let $distS := $p//speaker => distinct-values() => count()
return concat ($distT,", ", $distS)
```
This is the expression I used. It returns each plays names along side the number of speakers are in each play.

d.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
(:  :let $speak := $plays//speaker 
let $dist := $speak => distinct-values() :)
for $p in $plays
let $distT := $p//titleStmt/title
let $distS := $p//speaker => distinct-values() => count()
where $distS gt 50
return concat ($distT,", ", $distS)
```
When putting in the where function, just 7 results are returned to me. 

e. I don't know what makes this different from question E-d.
## 2
a. 
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
(:  :let $speak := $plays//speaker 
let $dist := $speak => distinct-values() :)
for $p in $plays
let $distT := $p//titleStmt/title
let $distS := $p//speaker => distinct-values() => count()
where $distS gt 50
return concat ($distT,", ", $distS)
```
This same Xquery that I used does not return the title tags.

b. 
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
(:  :let $speak := $plays//speaker 
let $dist := $speak => distinct-values() :)
for $p in $plays
let $distT := $p//titleStmt/title/base-uri()
let $distS := $p//speaker => distinct-values() => count()
where $distS gt 50
return concat ($distT,", ", $distS)
```
I wasn't exactly sure where to put `base-uri()` so I just slapped it onto the title. It tells me the filepath for the particular document.

c.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $plays := collection('/db/apps/shakespeare/data/')//TEI
(:  :let $speak := $plays//speaker 
let $dist := $speak => distinct-values() :)
for $p in $plays
let $tPath := $p/base-uri()
let $distT := $p//titleStmt/title
let $distS := $p//speaker => distinct-values() => count()
where $distS gt 50
return concat ($tPath,", ",$distT,", ", $distS)
```
I added a new variable for the file path so in the results I get the file path, then the plays title, and then the amount of speakers. This one still has the greater then 50 rule tagged onto it so there are only 7 results.

