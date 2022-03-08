# Joey Gardiner XQuery 3

## 1
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs//metadata/title
return $d
```
I get 93 results.
## 2
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs
let $title := $d//metadata/title
let $ln := $d//ln => count()
return concat($title, ", ", $ln)
```
This gives me each title with the number of lines next to it.
## 3
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs
let $length := $d//song => string-length()
return $length
```
This returns the string length in each document.
## 4
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs
let $length := $d//song => string-length()
order by $length descending
return $length
```
This returns all the string lengths in descending order.
## 5
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs
let $title := $d//metadata/title
let $ln := $d//ln => count()
let $length := $d//song => string-length()
order by $length descending
return concat("The title: ", $title, ", The line length: ", $ln, ", The string length: ", $length)
```
This returns everything I have looked at so far in a single return each.
## 6
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
let $songLengthsAll :=
    for $d in $disneySongs
    let $length := $d//song => string-length()
    return $length
let $maxSongLength := $songLengthsAll => max()
let $minSongLength := $songLengthsAll => min()
return concat($maxSongLength, ", ", $minSongLength)
```
This gives the 1 result but tells me two things. First it tells me the largest string length then it tells me the smallest string length. 
## 7
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
let $songLengthsAll :=
    for $d in $disneySongs
    let $length := $d//song => string-length()
    return $length
let $maxSongLength := $songLengthsAll => max()
let $minSongLength := $songLengthsAll => min()
for $d in $disneySongs
let $title := $d//metadata/title
let $lengthM := $d//song => string-length()
where $lengthM = $maxSongLength
return concat($title, ", ", $lengthM)
```
This gives me 1 line that contains the song with the highest string length and its title.
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
let $songLengthsAll :=
    for $d in $disneySongs
    let $length := $d//song => string-length()
    return $length
let $maxSongLength := $songLengthsAll => max()
let $minSongLength := $songLengthsAll => min()
for $d in $disneySongs
let $title := $d//metadata/title
let $lengthM := $d//song => string-length()
where $lengthM = $minSongLength
return concat($title, ", ", $lengthM)
```
When I try essencially the same thing for the min value I get 3 results. Each one has no title and ends with a string length of 0. 0 was the smallest string length I got earlier so I would assume that there is 3 documents that are just completely blank, which is odd.
I wanted to check on this so I ran this expression:
```
xquery version "3.1";
let $disneySongs := collection('/db/disneySongs/')
for $d in $disneySongs
let $length := $d//song => string-length()
order by $length ascending
let $title := $d//metadata/title
return concat($length, $title)
```
This also got three blank documents. I also tried to get the max string and title alongside the min string and title in the same result but I couldn't get it too work. I think it cannot work because there are 3 identical min strings in this collection and they cannot all be placed into one line. 